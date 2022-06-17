project('seticore', ['cpp', 'c', 'cuda'],
        default_options: [
            'buildtype=release',
            'cpp_std=c++14',
        ])

cmake = import('cmake')

fmt_subproj = cmake.subproject('fmt')
fmt_dep = fmt_subproj.dependency('fmt')

boost_dep = dependency('boost', modules: ['program_options'])

hdf5_dep = dependency('hdf5', language: 'c')

cuda_dep = dependency('cuda')

capnp_subproj = cmake.subproject('capnproto')
kj_dep = capnp_subproj.dependency('kj')
capnp_dep = capnp_subproj.dependency('capnp')

deps = [fmt_dep, boost_dep, hdf5_dep, cuda_dep, kj_dep, capnp_dep]

srcs = [
    'dedoppler.cu',
    'dat_file_writer.cpp',
    'filterbank_file.cpp',
    'fil_file.cpp',
    'h5_file.cpp',
    'hit.capnp.c++',
    'hit_file_writer.cpp',
    'hit_recorder.cpp',
    'recipe_file.cpp',
    'run_dedoppler.cpp',
]

executable('seticore', srcs + ['main.cpp'], dependencies: deps)