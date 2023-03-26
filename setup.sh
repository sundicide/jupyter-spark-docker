echo "Initializing Spark environment..."

if [ ! -f /config/kernel.json ]; then
    cp /kernel.json /config/kernel.json
fi

if [ ! -f /config/run.sh ]; then
    cp /run.sh /config/run.sh
fi

if [ ! -f /config/jupyter_notebook_config.py ]; then
    cp /jupyter_notebook_config.py /config/jupyter_notebook_config.py
fi

if [ ! -d /config/spark ]; then
    mv spark-3.2.3-bin-hadoop2.7 /config/spark
    rm spark-3.2.3-bin-hadoop2.7.tgz
fi

if [ ! -d /config/toree ]; then
    mv toree /config/toree
fi

mkdir -p /root/.jupyter
cp /config/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

mkdir -p /root/.local/share/jupyter/kernels/jupyter-spark
cp /config/kernel.json /root/.local/share/jupyter/kernels/jupyter-spark/kernel.json

cd /notebooks

echo "Setup complete!"

/run.sh