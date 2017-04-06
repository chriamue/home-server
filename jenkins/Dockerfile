FROM jenkins
USER root
RUN apt-get update
RUN apt-get install -y clang cmake doxygen doxygen-latex graphviz libboost-all-dev libpoco-dev libopencv-dev qt5-default qttools5-dev  g++ libsqlite3-dev imagemagick texlive-latex-extra texlive-fonts-extra texlive-science cppcheck wget python valgrind
RUN wget https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py -P /usr/bin
USER jenkins
