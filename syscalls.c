int _close(int file)
{
  return -1; // Indicate that the file cannot be closed.
}

int _lseek(int file, int ptr, int dir)
{
  return 0; // Indicate that the position is unchanged.
}

int _read(int file, char *ptr, int len)
{
  return 0; // Indicate end-of-file, or no data read.
}

int _write(int file, char *ptr, int len)
{
  // Example implementation could send data to a UART port, etc.
  // For stub, just pretend we wrote all bytes successfully.
  return len;
}