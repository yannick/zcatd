import 
  std.zlib, 
  std.file,
  std.stdio;

void main(string[] args)
{
  auto f = File(args[1], "rb");
  auto uncompressor = new UnCompress(HeaderFormat.gzip);

  foreach (ubyte[] buffer; f.byChunk(4096))
  {
          auto uncompressed = cast(immutable(string)) uncompressor.uncompress(buffer.dup);
          write(uncompressed);          
  }
}
