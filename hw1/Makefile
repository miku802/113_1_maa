# 定義需要編譯的目標
TARGETS = hw1_1 hw1_2 hw1_3 hw1_4 hw1_5 hw1_6 hw1_7

# 編譯器設置
CC = gcc
CFLAGS = -g -no-pie

# 默認目標是編譯所有的文件
all: $(TARGETS)

# 將每個目標與其相應的源文件關聯
$(TARGETS): % : %.s
	$(CC) $(CFLAGS) $< -o $@

# 清理編譯產生的所有可執行文件
clean:
	rm -f $(TARGETS)

#already finish: 1, 2, 6
