#include <iostream>
#include <vector>
#include <windows.h>
#include <iomanip>
#include <numeric> // 用于 std::iota
#include <cmath>
using namespace std;

// 高精度计时函数
template <typename Func>
double measure_time(Func func, int rounds = 1000) {
    LARGE_INTEGER freq, start, end;
    QueryPerformanceFrequency(&freq);
    func(); // 预热
    double total_time = 0.0;
    for (int i = 0; i < rounds; i++) {
        QueryPerformanceCounter(&start);
        func();
        QueryPerformanceCounter(&end);
        double single_time = (end.QuadPart - start.QuadPart) * 1000.0 / freq.QuadPart;
        total_time += single_time;
    }
    return total_time / rounds;
}

// 1. 平凡算法：顺序累加
long long sum_naive(const vector<long long>& arr) {
    long long sum = 0;
    for (size_t i = 0; i < arr.size(); ++i) {
        sum += arr[i];
    }
    return sum;
}

// 2. 超标量优化：循环展开 (Loop Unrolling) - 4路
// 这种写法允许 CPU 同时计算多个加法，减少分支预测失败
long long sum_unrolled(const vector<long long>& arr) {
    long long sum = 0;
    size_t i = 0;
    // 主循环：每次处理4个元素
    for (; i + 4 <= arr.size(); i += 4) {
        sum += arr[i];
        sum += arr[i + 1];
        sum += arr[i + 2];
        sum += arr[i + 3];
    }
    // 尾部处理：处理剩余不足4个的元素
    for (; i < arr.size(); ++i) {
        sum += arr[i];
    }
    return sum;
}

// 3. 分块累加 (Blocked Summation)
// 模拟题目中的“两两相加，中间结果再相加”的思想，减少单个变量的依赖链
long long sum_blocked(const vector<long long>& arr, int block_size = 16) {
    vector<long long> block_sums((arr.size() + block_size - 1) / block_size, 0);
    
    for (size_t i = 0; i < arr.size(); ++i) {
        block_sums[i / block_size] += arr[i];
    }
    
    long long total = 0;
    for (auto s : block_sums) {
        total += s;
    }
    return total;
}

int main() {
    system("chcp 65001 > nul");

    // 定义测试的规模：从 1MB 到 256MB，跨越不同缓存层级
    vector<int> sizes = {
        1024 * 1024 / 8,       // 1MB
        4 * 1024 * 1024 / 8,   // 4MB
        16 * 1024 * 1024 / 8,  // 16MB
        64 * 1024 * 1024 / 8,  // 64MB
        256 * 1024 * 1024 / 8  // 256MB
    };

   /* cout << "===== 数组求和性能测试 (分析缓存影响) =====" << endl;
    cout << left << setw(12) << "Size(MB)" 
         << setw(15) << "Naive(ms)" 
         << setw(15) << "Unrolled(ms)" 
         << setw(15) << "SpeedUp" << endl;
    cout << "----------------------------------------------" << endl;
*/
    for (auto n : sizes) {
        // 初始化数据：使用连续内存，避免指针跳跃
        vector<long long> arr(n, 1); 
        // 为了防止编译器在多次循环中优化掉计算，我们用 volatile 变量接收结果
        volatile long long result1, result2;

        // 测试平凡算法
        auto func1 = [&]() {
            result1 = sum_naive(arr);
        };
        double time1 = measure_time(func1, 1000); // 数据量大，减少轮次防止卡顿
    }
       
/*
        // 测试优化算法
        auto func2 = [&]() {
            result2 = sum_unrolled(arr);
        };
        double time2 = measure_time(func2, 1000);}
        */
/*
        // 验证结果（确保计算正确，防止编译器优化）
        if (result1 != n || result2 != n) {
            cout << "Error: 计算结果错误" << endl;
            return 1;
        }

        double speedup = time1 / time2;

        cout << left << setw(12) << fixed << setprecision(1) << (n * 8.0 / 1024 / 1024)
             << setw(15) << fixed << setprecision(3) << time1
             << setw(15) << fixed << setprecision(3) << time2
             << setw(15) << fixed << setprecision(2) << speedup << endl;
    }

     cout<<endl;
     
     
    cout << left << setw(12) << "Size(MB)" 
         << setw(15) << "Naive(ms)" 
         << setw(15) << "Blocked(ms)" 
         << setw(15) << "SpeedUp" << endl;
    cout << "---------------------block-------------------------" << endl;

    for (auto n : sizes) {
        // 初始化数据：使用连续内存，避免指针跳跃
        vector<long long> arr(n, 1); 
        // 为了防止编译器在多次循环中优化掉计算，我们用 volatile 变量接收结果
        volatile long long result1, result2;

        // 测试平凡算法
        auto func1 = [&]() {
            result1 = sum_naive(arr);
        };
        double time1 = measure_time(func1, 50); // 数据量大，减少轮次防止卡顿

        // 测试优化算法
        auto func2 = [&]() {
            result2 = sum_blocked(arr);
        };
        double time2 = measure_time(func2, 50);

        // 验证结果（确保计算正确，防止编译器优化）
        if (result1 != n || result2 != n) {
            cout << "Error: 计算结果错误" << endl;
            return 1;
        }

        double speedup = time1 / time2;

        cout << left << setw(12) << fixed << setprecision(1) << (n * 8.0 / 1024 / 1024)
             << setw(15) << fixed << setprecision(3) << time1
             << setw(15) << fixed << setprecision(3) << time2
             << setw(15) << fixed << setprecision(2) << speedup << endl;
    }
*/

    return 0;
}
