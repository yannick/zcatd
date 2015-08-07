import 
  std.zlib, 
  std.file,
  std.stdio;

void main(string[] args)
{
  auto f = File(args[1], "rb");
  auto uncompressor = new UnCompress(HeaderFormat.gzip);

  foreach (ubyte[] buffer; f.byChunk(512*1024))
  {
          auto uncompressed = cast(char[]) uncompressor.uncompress(buffer.idup);
          write(uncompressed);          
  }
  write( cast(char[]) uncompressor.flush );
}
