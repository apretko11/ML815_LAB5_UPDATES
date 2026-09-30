conda create -y -n megatron python=3.9
conda activate megatron

python --version
which python
python -m pip --version

python -m pip install numpy==1.26.4
python -m pip install torch==2.3.1 torchvision==0.18.1 \
    --index-url https://download.pytorch.org/whl/cu121
    
conda install -y -c nvidia/label/cuda-12.1.0 cuda-toolkit=12.1.0

export CUDA_HOME="$CONDA_PREFIX"
export PATH="$CUDA_HOME/bin:$PATH"
export CC=/usr/bin/gcc-11
export CXX=/usr/bin/g++-11
export CUDAHOSTCXX="$CXX"
hash -r

python -m pip install \
    setuptools==69.5.1 \
    wheel==0.43.0 \
    packaging==24.1 \
    ninja==1.11.1.3 \
    pybind11==2.13.1

git clone --branch 24.04.01 --single-branch https://github.com/NVIDIA/apex.git

export MAX_JOBS=2

python -m pip install -v \
    --no-build-isolation \
    --config-settings "--build-option=--cpp_ext" \
    --config-settings "--build-option=--cuda_ext" \
    ./apex

python -m pip install einops==0.8.0

MAX_JOBS=2 python -m pip install -v \
    flash-attn==2.5.9.post1 \
    --no-build-isolation \
    --no-cache-dir
    
python -m pip install \
    deepspeed==0.16.2 \
    transformers==4.44.2 \
    --no-build-isolation \
    --no-cache-dir

python -m pip install \
    tensorstore==0.1.45 \
    zarr==2.18.2 \
    numcodecs==0.12.1 \
    six==1.16.0 \
    tensorboard==2.17.0 \
    regex==2026.1.15 \
    psutil==7.2.2
