# Project: 數字由 1 從最中間順時鐘往外依序寫下

以下是一個 5×5 矩陣:

                     21 22 23 24 25
                     20  7  8  9 10
                     19  6  1  2 11
                     18  5  4  3 12
                     17 16 15 14 13

-------------------------------------------------------------------------------------------------------
## A. matrixClockwise(n)

	→ 產生上述 n×n 的矩陣
	
    	Input: n, an integer, 矩陣大小
    	Output: B, a matrix (n×n) 
    	example: 
    	>> n=5;
    	>> matrixClockwise(n)

	做法: 
	1. 先造出一個 n×n 的零矩陣

	2. 將數字依順時針填入矩陣:
		→ (i) 當 n 為偶數時:
			    (i)-1, 在中心方塊的左上角填入"1"
			    (i)-2, 向右 & 向下 n 格, n=1,3,5...
			    (i)-3, 向左 & 向上 n 格, n=2,4,6...
				   * 因為矩陣沒有第0位置, 所以須限制當為第0位置時停止

		   (ii) 當 n 為奇數時: 
			    (ii)-1, 在中心位置填入"1"
			    (ii)-2, 向右 & 向下 n 格, n=1,3,5...
			    (ii)-3, 向左 & 向上 n 格, n=2,4,6...

	3. 令 B 矩陣為 A 矩陣的左上角 n×n 矩陣

	4. 顯示 B 矩陣

-------------------------------------------------------------------------------------------------------
## B. matrixSum(n)
	→ 給定 n×n 的此種矩陣, 求其對角線 (a_i,i) 及反對角線 (a_n−i,i) 之總和
	
    	Input: n, an integer, 矩陣大小
    	Output: sum, an integer, 其對角線 (a_i,i) 及反對角線 (a_n−i,i) 之總和
    	example: 
    	>> n=5;
    	>> matrixSum(n)

	做法: 
	1. 計算總和
		→ (i) 當 n 為偶數時:
		      (i)-1, 設定初始總和為"0"
		      (i)-2, 總和 = 總和 + (n-2)^2*4+(n-1)*10, n=2,4,6...
				         (* e.g. n=6:  對角線與反對角線的數字為由小到大排列為
					                   /   n=2   /     n=4    /     n=6    
					               → 0 / 1,2,3,4 / 7,10,13,16 / 21,26,31,36
					                   /  公差=1 /   公差=3   /   公差=5   
					               → 0 / 0*4+1*10/  4*4+3*10  /  16*4+5*10 
					               → 總和 = 總和 + (n-2)^2*4+(n-1)*10, n=2,4,6...)

		   (ii) 當 n=1 時: 總和=1

		   (iii) 當 n 為奇數但大於 1 時: 
			 (iii)-1, 設定初始總和為"1"
			 (iii)-2, 總和 = 總和 + (n-2)^2*4+(n-1)*10, n=3,5,7...
				         (* e.g. n=7:  對角線與反對角線的數字為由小到大排列為
					                  n=1 /   n=3   /     n=5     /     n=7    
					               →   1  / 3,5,7,9 / 13,17,21,25 / 31,37,43,49
					                      /  公差=2 /   公差=4    /   公差=6   
					               →   1  / 1*4+2*10/  9*4+4*10   /  25*4+6*10 
					               → 總和 = 總和 + (n-2)^2*4+(n-1)*10, n=3,5,7...)
			 (iii)-3, 因為中心"1"重複算一次, 所以總和還需再加"1"

	2. 顯示總和

-------------------------------------------------------------------------------------------------------
## C. primeOrComposite()
	→ 給定 200×200 的此矩陣, 將所有質數點位置設為黑色, 非質數點位置設為白色,
	  皆不是則設為藍綠色, 以 image 顯示出此矩陣樣子
	  
    	Output: B, a graph
    	example: 
    	>> primeOrComposite()

	做法: 
	1. 寫一個function, 給定一個數字, 判斷其是否為質數:
		 → 從 2 一直到"給定數字開根號後再無條件捨去的值",檢查相除是否有餘數, 
		   如果有代表此數字為合數, 反之則為質數

	2. 採用 matrixClockwise(n) 的偶數部分:
		 → 取 n=200, 產生 200×200 的矩陣

	3. 將數字轉成顏色:
		 → (i) 建立一個色盤
		   (ii) 取用色盤
		   (iii) 利用 1. 判斷是否為質數並改顏色

	4. 顯示圖像
