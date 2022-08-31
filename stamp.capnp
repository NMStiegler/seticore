# To regenerate the files that are based on this schema, run:
# capnp compile -oc++ stamp.capnp

# unique id generated by capnp
@0xb811e7262df2bb01;

# A "postage stamp" of data extracted from a larger set of raw data.
# This data has been upchannelized with an FFT but is still multi-antenna
# complex voltages.
struct Stamp {
  # source, ra, and dec refer to the boresight target.
  sourceName @0 :Text;
  ra @1 :Float64;
  dec @2 :Float64;

  # Other standard metadata found in FBH5 files.
  # This metadata applies specifically to the postage stamp itself, not the larger
  # file we extracted it from.
  fch1 @3 :Float64;
  foff @4 :Float64;
  tstart @5 :Float64;
  tsamp @6 :Float64;
  telescopeId @7 :Int32;

  # Dimensions of the data
  numAntennas @8 :Int32;
  numTimesteps @9 :Int32;
  numChannels @10 :Int32;

  # An array of complex voltages. Interpret this as row-major:
  #   data[antenna][timestep][channel][real vs imag]
  data @11 :List(Float32);

  # Metadata describing how this stamp was extracted from raw files.

  # Which of the coarse channels in the input data this stamp is from
  coarseChannel @12 :Int32;

  # The center frequency of the coarse channel we got this data from.
  # This is redundant with coarseChannel if you have the input file, but useful
  # if you don't have the input file.
  coarseCenter @13 :Float64;

  # The size of the FFT we used to upchannelize
  fftSize @14 :Int32;

  # Column zero in the data corresponds to this column in the post-FFT coarse channel
  channelOffset @15 :Int32;
}
