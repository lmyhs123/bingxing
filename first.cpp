#include<iostream>
#include <windows.h>
#include <algorithm>
#include <cstdlib>   // 随机数相关（可选，用于打破数据规律）
#include <ctime>     // 时间种子（可选）
using namespace std;

// 通用高精度计时函数（模板函数）
// 参数1：要计时的代码块（lambda表达式）；参数2：测试轮数（默认10000轮减小误差）
// 返回值：代码块运行的平均耗时（毫秒）
template <typename Func>
double measure_time(Func func, int rounds = 100) {
    LARGE_INTEGER freq, start, end;
    // 获取CPU高性能计数器频率（用于转换时间单位）
    QueryPerformanceFrequency(&freq);
    
    // 预热：首次运行可能有Cache未命中，避免干扰最终结果
    func();
    
    double total_time = 0.0;
    // 多轮测试取平均，减小计时误差
    for (int i = 0; i < rounds; i++) {
        QueryPerformanceCounter(&start);  // 记录开始时间
        func();                           // 执行待测试代码块
        QueryPerformanceCounter(&end);    // 记录结束时间
        
        // 计算单次耗时（转换为毫秒）并累加
        double single_time = (end.QuadPart - start.QuadPart) * 1000.0 / freq.QuadPart;
        total_time += single_time;
    }
    
    return total_time / rounds;  // 返回平均耗时
}

int main()
{
    system("chcp 65001 > nul");
    // ==================== 1. 初始化测试参数（适配你的缓存） ====================
    const int n =512;  
    
    // ==================== 2. 创建并初始化矩阵（连续内存，Cache友好） ====================
    int** a = new int*[n];
    for(int i = 0; i < n; i++) {
        a[i] = new int[n];
    }
    
    // 方式1：固定规律数据（易验证结果）
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            a[i][j] = i + j;
        }
    }
    
    // 方式2：随机数据（避免编译器识别规律优化，可选）
    // srand(time(0));  // 初始化随机数种子
    // for(int i = 0; i < n; i++) {
    //     for(int j = 0; j < n; j++) {
    //         a[i][j] = rand() % 100;  // 随机0-99
    //     }
    // }

    // ==================== 3. 创建并初始化向量 ====================
    int* result = new int[n];    // 平凡算法结果数组
    int* vec = new int[n];       // 输入向量
    for(int i = 0; i < n; i++) {
        vec[i] = 2;  // 向量所有元素为2，简化计算
    }

    // ==================== 4. 平凡算法（列优先遍历，Cache不友好） ====================
    auto naive_func = [&]() {
        // 每轮重新初始化结果数组（避免上一轮结果干扰）
        for(int i = 0; i < n; i++) {
            result[i] = 0;
        }
        // 列优先遍历：a[row][col]跨行长跳，L1/L2 Cache命中率极低
        for(int col = 0; col < n; col++) {
            for(int row = 0; row < n; row++) {
                result[col] += a[row][col] * vec[row];
            }
        }
    };
    // 计时：显式指定10000轮，与优化算法保持一致
    double naive_time = measure_time(naive_func, 100);

    // ==================== 5. Cache优化算法（适配三级缓存） ====================
    int* result_opt = new int[n];  // 优化算法结果数组（避免覆盖平凡算法结果）
    const int BLOCK_SIZE = 128;    // 分块大小：适配L1=1MB/L2=16MB，平衡开销与命中率
    auto opt_func = [&]() {
        // 每轮重新初始化结果数组
        for(int i = 0; i < n; i++) {
            result_opt[i] = 0;
        }
        
        // 外层：列分块（减少Cache换页，匹配L2=16MB）
        for(int col_block = 0; col_block < n; col_block += BLOCK_SIZE) {
            // 分块边界（避免数组越界）
            int col_end = min(col_block + BLOCK_SIZE, n);
            
            // 中层：行优先遍历（匹配L1=1MB，连续数据驻留L1）
            for(int row = 0; row < n; row++) {
                // 寄存器复用：vec[row]仅从L1读1次，后续从寄存器取（比L1快10倍）
                int v = vec[row];
                // 内层：分块内列遍历（数据在L2/L3，无需频繁访问内存）
                for(int col = col_block; col < col_end; col++) {
                    result_opt[col] += a[row][col] * v;
                }
            }
        }
    };
    // 计时：与平凡算法统一10000轮
    double opt_time = measure_time(opt_func, 100);

    // ==================== 6. 输出测试结果 ====================
   cout << "===== Test Result (n=" << n << ") =====" << endl;
    cout << "Normal Time: " << naive_time << " ms" << endl;
    cout << "Cache Opt Time: " << opt_time << " ms" << endl;
    cout << "Speed Up: " << naive_time / opt_time << " x" << endl;

    cout << "\n===== Check Result =====" << endl;
    cout << "Normal Result: " << result[0] << endl;
    cout << "Opt Result: " << result_opt[0] << endl;


    // ==================== 8. 释放所有动态内存（避免内存泄漏） ====================
    for(int i = 0; i < n; i++) {
        delete[] a[i];
    }
    delete[] a;
    delete[] vec;
    delete[] result;
    delete[] result_opt;

   
    
    return 0;
}