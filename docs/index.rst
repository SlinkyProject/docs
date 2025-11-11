.. slinky-sphinx-docs documentation master file, created by
   sphinx-quickstart on Tue Aug  5 15:59:19 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Slinky
================================

.. image:: _static/images/slinky-equation.svg
   :width: 80%
   :align: center
   :alt: Kubernetes + Slurm = Slinky



Welcome to Slinky, a set of powerful integration tools designed to bring Slurm's capabilities into Kubernetes. Whether you’re managing high-performance computing (HPC) workloads or operating within cloud-native environments, Slinky helps bring together the best of both worlds for efficient resource management and scheduling. Slinky enables the deployment of both training and inference workloads on the same cluster.

Slinky is made by `SchedMD <https://schedmd.com/>`_, the lead developers of Slurm.

.. card:: Slurm-operator
   :link: https://slinky.schedmd.com/projects/slurm-operator
   :link-alt: slurm-operator

   Slurm-operator allows users to run workloads on Slurm within a Kubernetes cluster, taking advantage of many of the advanced scheduling features of Slurm within a cloud-native environment. Slurm-operator allows for resources to be shared between Slurm and Kubernetes - improving resource utilization.

   .. image:: _static/images/architecture-operator.svg
      :width: 90%
      :align: center
      :alt: Kubernetes + Slurm = Slinky

.. card:: Slurm-bridge
   :link: https://slinky.schedmd.com/projects/slurm-bridge
   :link-alt: slurm-bridge

   Slurm-bridge contains a `Kubernetes <https://kubernetes.io/>`__ scheduler to manage select
   workloads from Kubernetes, which allows for co-location of Kubernetes
   and Slurm workloads within the same cluster.

   .. image:: _static/images/slurm-bridge_big-picture.svg
      :width: 90%
      :align: center
      :alt: Kubernetes + Slurm = Slinky

.. card:: Slinky containers
   :link: https://slinky.schedmd.com/projects/containers/en/latest/
   :link-alt: slurm-bridge

   SchedMD publishes a suite of container images to support `slurm-operator` and `slurm-bridge`
