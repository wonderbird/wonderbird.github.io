---
title: Jupyter Notebooks
layout: default
---

## Jupyter Notebooks

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Tutorials](#tutorials)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Special Markdown](#special-markdown)
- [Performance Analysis](#performance-analysis)
- [Including Plots into Jupyter Notebooks](#including-plots-into-jupyter-notebooks)
- [Debugging](#debugging)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Tutorials

- Packt: [Getting started with the Jupyter notebook (part 1)](https://hub.packtpub.com/getting-started-jupyter-notebook-part-1/)

### Keyboard Shortcuts

| Key         | Function                               |
| ----------- | -------------------------------------- |
| Enter       | Toggle ''edit mode'' for active cell   |
| Shift+Enter |''Run'' active cell and ''move'' to next|
| Ctrl+Enter  |''Run'' active cell and ''stay'' there  |
| Tab         |Show available ''completions''          |
| Shift+Tab   |Show ''help'' for command under cursor  |

### Special Markdown

- [Markdown Cheat Sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Daring Fireball: Markdown Syntax](https://daringfireball.net/projects/markdown/syntax)

#### MathJax

- [LaTeX Primer](http://data-blog.udacity.com/posts/2016/10/latex-primer/)
- [Comprehensive List of TeX Commands Available in MathJax](http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm)
- [DeTeXify - Identify LaTeX command by drawing a symbol](http://detexify.kirelabs.org/classify.html)

| MathJax | Description |
| --- | --- |
| $$a = \frac{b}{c}$$ | `$$a = \frac{b}{c}$$` defines a LaTeX formula rendered using MathJax. The formula is displayed **centered**. |
| $a = \frac{b}{c}$ | `$a = \frac{b}{c}$` defines inline LaTeX math. The formula is displayed **inline** with the text. |

#### Magic Keywords

- Start a line with `%` to include a magic keyword for the **current line**.
- Start a line with `%%` to include a magic keyword for the **entire cell**.

### Performance Analysis

#### Calculate the time a **specific function call** requires

```python
%timeit my_function(arg1, arg2)
```

![timeit](/assets/jupyter-notebooks/magic-timeit.png)

#### Calculate the time an **entire cell** requires

```python
%%timeit
...
# cell contents
...
```

![timeit for an entire cell](/assets/jupyter-notebooks/magic-timeit-cell.png)

### Including Plots into Jupyter Notebooks

```python
%matplotlib inline
```

The parameter `inline` specifies that the "inline" backend shall render the diagram directly into the Jupyter window. If you **omit** that parameter, the diagram will be rendered into a **new window**.

On a retina display the rendered diagram can look **blurry**. To correct this, use

```python
%config InlineBackend.figure_format = 'retina'
```

to render high resolution images.

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(20)
y = x**2

plt.plot(x, y)
```

#### Example by Udacity

![matplotlib example](/assets/jupyter-notebooks/matplotlib.png)

&rarr; [Matplotlib Tutorial](https://www.python-kurs.eu/matplotlib.php)

### Debugging

Use the magic command

```python
%pdb
```

to launch the debugger when the executed python script hits an error condition. Find the [python debugger help page here](https://docs.python.org/3/library/pdb.html).

To get the [IPython debugging shell](https://davidhamann.de/2017/04/22/debugging-jupyter-notebooks/) with syntax highlighting, add the following code to your cell:

```python
from IPython.core.debugger import set_trace

def add_to_life_universe_everything(x):
    answer = 42
    set_trace()
    answer += x
    
    return answer

add_to_life_universe_everything(12)
```

### References

- [Jupyter Notbebooks Documentation](https://jupyter.org/documentation)
- [Python Debugger](https://docs.python.org/3/library/pdb.html)
- [IPython Magic Commands: pdb (Python Debugger)](https://docs.python.org/3/library/pdb.html)
- [Debugging Jupyter Notebooks](https://davidhamann.de/2017/04/22/debugging-jupyter-notebooks/)
- [Jupyter: Get Started](https://jupyter.readthedocs.io/en/latest/content-quickstart.html)
- [Jupyter Notebook Beginner Guide](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/)
- [Jupyter Docker Stack](https://jupyter-docker-stacks.readthedocs.io/en/latest/)
