===========================
����������� �� ������� AROS
===========================

:Authors:   David Le Corfec
:Copyright: Copyright � 2004, The AROS Development Team
:Version:   $Revision: 20980 $
:Date:      $Date: 2004-02-19 11:01:55 +0700 (Чт, 19 фев 2004) $
:Status:    �� ���������.

��� ����������� ��������� ��������� ����������� �� ������ � ����������
�������������� � AROS. 
 
.. Contents::

--------
��������
--------

��� ����������� ������������� ���������� ������ ��������� � �������
����������� � ������������� hosted-������ AROS, ������������� ��� Linux (���
����������� �������� �����) ��� BSD. � ���� ������ �� ������� ������������ �
Linux ���������� GDB ��� ������ � ���������� ������ � AROS. ��� ����� �����
��������������� AROS ��� ����������� ������ ��� ������� ������������ ����
``--enabe-debug``. ������ �����������, ���������� ���������� ����� �����������
��������� �����, ���������� AROS �� �����.

�������������, ���������� � ����������� �� ������ ������, ��������, ������� �����
������������ ����� ���������� ���������� �� ���������������� ����.

������������ ���������� ������ �������������, ��� �� ��������� ����� ����������
������ ������������ ��� ���������� ��� ������� �������. AROS ������������� ���
����� ��������� �����������.

---------------------------
����� ���������� ����������
---------------------------

 ::

    #define DEBUG 1
    #include <aros/debug.h>
    ...
    D(bug("value1=%ld, path=%s", value, path));

���� �������� ``DEBUG`` ����� 0 ��� ������������, �� ����������� ���������
``D()`` ����� �����. ��� ��������������� ������ ���������� ���������� ���
����������� �� ����, ������ �������� ``DEBUG`` ����������� ������� ``bug()``
�������� . ��������� ����� ��, ��� � � ������� ``printf()``. � hosted-������,
����� ����� ������������� �� �� �������, � ������� ���� �������� AROS.

-----------------------------------------------
Hosted-������ AROS: ������������� ��������� GDB
-----------------------------------------------

�� ������ ���� ��������� AROS � GDB, ���� ������������ GDB ����� ����, ��� AROS
�������� ������ � ������� ���� ������. �� ��������, ��� ����� ���� ����������
������������� AROS � ������ ������� (``./configure --enable-debug``).


������� � �������� �������
==========================

��������� GDB ��� �������� ����::

    > cd /AROS/bin/linux-i386/AROS/
    > gdb aros
    GNU gdb 6.0-debian
    Copyright 2003 Free Software Foundation, Inc.
    GDB is free software, covered by the GNU General Public License, and you are
    welcome to change it and/or distribute copies of it under certain conditions.
    Type "show copying" to see the conditions.
    There is absolutely no warranty for GDB.  Type "show warranty" for details.
    This GDB was configured as "i386-linux"...
    (gdb) 

����� ��������� AROS ��� ������� � GDB::

    (gdb) r
    Starting program: /AROS/bin/linux-i386/AROS/aros 
    (...����� ������� ���������� ���������� ����������...)
    
�� ������ ���������� AROS ���������, ��������� �� ����� ������� ``r``.
����������� ��������� ������ Ctrl-C � ������� ��� ���������� ������ AROS �
�������� ������� � ��������� ������ GDB. ������� ``help`` ������������� ���
������ �������, � ``q`` - ��� ������.


������� �� ����� ������
=======================

��-������, ��� ���� �������� �������� ����� ������, ��������, ��������� ��������
ulimit �������� bash. ����� ����� ��������� AROS � ������������ ���� ������::

    > cd /AROS/bin/linux-i386/AROS/
    > ulimit -c unlimited # ��. ����������� �������� ��� ��������� ����� ������
    > ./aros
    Quit (core dumped)

������ ��������� GDB, ����� ����� ������������ ����� AROS � ����� �����::

    > gdb aros core
    GNU gdb 6.0-debian
    Copyright 2003 Free Software Foundation, Inc.
    GDB is free software, covered by the GNU General Public License, and you are
    welcome to change it and/or distribute copies of it under certain conditions.
    Type "show copying" to see the conditions.
    There is absolutely no warranty for GDB.  Type "show warranty" for details.
    This GDB was configured as "i386-linux"...
    Core was generated by `aros'.
    Program terminated with signal 3, Quit.
    Reading symbols from /usr/X11R6/lib/libX11.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libX11.so.6
    Reading symbols from /usr/X11R6/lib/libXext.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libXext.so.6
    Reading symbols from /lib/libc.so.6...done.
    Loaded symbols for /lib/libc.so.6
    Reading symbols from /lib/libdl.so.2...done.
    Loaded symbols for /lib/libdl.so.2
    Reading symbols from /lib/ld-linux.so.2...done.
    Loaded symbols for /lib/ld-linux.so.2
    #0  0x40125607 in sigsuspend () from /lib/libc.so.6
    (gdb)


GDB (�������� �������)
=====================

������� ``help`` �������� ������� �� ���� �������� GDB. Ÿ ����� �������� ����
������ ������ ��������� ���������� ������, ���� ����� �� ������� ��� ��������
(��� ���� �� ������������) �������.

����� � ������ ������� �� ������ �������� ��������� ��� ������ ������� �� ����
��������, ������� ������ ������� �����.

������� ``bt`` (backtrace) ������� ��� ����������� ����� ����� ���� ��������
�����������. ����� ������� ������ ������������ ����� ���������� AROS �� �������
Ctrl-C � ������� GDB::

    Program received signal SIGINT, Interrupt.
    0x40125607 in sigsuspend () from /lib/libc.so.6
    (gdb) bt
    #0  0x40125607 in sigsuspend () from /lib/libc.so.6
    #1  0x080531d5 in idleTask (sysBase=0x40231290) at idletask.c:23
    #2  0x08052ba7 in Exec_NewAddTask (task=Cannot access memory at address 0x8
    ) at newaddtask.c:280
    Previous frame inner to this frame (corrupt stack?)
    (gdb) 

����� #0 �������� ���������� ������.

��� ������ �������� ��������� ���������� �� �������� �����, ����������� �������
``p`` (print)::

    (gdb) p SysBase
    $1 = (struct ExecBase *) 0x40231290

GDB �������� ����� ������� ��������� ������ ���������� ����������.
�� �������� �������� ����� ��, ������� �� ������ ������� ����� ����������
���������::

    (gdb) p SysBase->IntVects[2]
    $2 = {iv_Data = 0x0, iv_Code = 0x8052f30 <SoftIntDispatch>, iv_Node = 0x4023c528}

�� ����� ������ ������������ ``print`` � �������� 16-������� ������������::

    (gdb) p 0x42 + 0xc0de
    $1 = 49440

��� ������ ���������� � 16-������ ���� ����������� ``p/x``(��� ���� �� ������
������� ���������� ���������)::

    (gdb) p/x $1
    $2 = 0xc120

��� ����������� ����� ������� ����������� ������� ``f`` (frame)::

    (gdb) f 1
    #1  0x080531d5 in idleTask (sysBase=0x40231290) at idletask.c:23
    23              sigsuspend(&sigs);

��� ������ ��������� 10-�� ����� ���� ������ ������� ``l`` (list), ������� �����
����� �������������� ��� ������ ������������ ������.

���� �� ����������� ��������� � �������� �������:

+ ��� ����������� ���������� (��� ����������� � ������) ��������� �� ���� �������
  ��� �� � �������, ��� �� ���������� ����� ��������, ��� ��� ���� ���������, 
  ����������� ������� ``r`` (run) � ��������������� �����������, ������� �����
  ������������ ���������;

+ ��� ���������� ���������� ��������� ����������� ������� ``s`` (step) ��� ``n``
  (next) (������ �� ��� ���������� ����� ������������ �� ���� ���);

+ ��� ��������� ����� �������� ������� ������� ``b`` � ����� ������ ��� �������;

+ ��� ����������� ���������� ��������� � ��������� ������ ������� ``c``.

����������� ������� ``q`` ��� ������ �� GDB::

    (gdb) q
    The program is running.  Exit anyway? (y or n) y
    >

����������� ��� AROS ������� GDB 
================================

����������� ��� AROS ������� GDB ��������� � ����� ``/AROS/_gdbinit``, �������
��������������� � ``/AROS/bin/linux-i386/AROS/.gdbinit``.

���� ���� ������������� ���������� GDB ��� ������� � �������� ��������� �������::

    findaddr - ���������� ������, ������� �������� ������ �����
    thistask - ������� ���������� � ���������� � ������ ������ ������.
    liblist - ������ ���������� � ������� ���������
    devlist - ������ ����������� � ������� ����������
    resourcelist - ������ �������� ������� � ������ ������
    residentlist - ������ ����������� �������� � �������
    taskready - ������ ����� ������� � �������
    taskwait - ������ �����, ��������� ������-���� �������
    modlist - ������ ���� ������� � ������� ������ ����������� � ������
    printtaglist - ������� ������ ������ �����

� ���� ������ ``findaddr`` ���������� ��� ���������� ������� ���� � ����������
������ (��������� ������������ ���������, ����������...)

������������� ������� findaddr
------------------------------

�������� ����� ��� ����� ���������� ���������� ���������� ��� ����������, ��
��� ������������� ������� ``backtrace`` ������ ��� ���� ��� ������ 
�� ����������� �������::

    Core was generated by `aros'.
    Program terminated with signal 11, Segmentation fault.
    Reading symbols from /usr/X11R6/lib/libX11.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libX11.so.6
    Reading symbols from /usr/X11R6/lib/libXext.so.6...done.
    Loaded symbols for /usr/X11R6/lib/libXext.so.6
    Reading symbols from /lib/libc.so.6...done.
    Loaded symbols for /lib/libc.so.6
    Reading symbols from /lib/libdl.so.2...done.
    Loaded symbols for /lib/libdl.so.2
    Reading symbols from /lib/ld-linux.so.2...done.
    Loaded symbols for /lib/ld-linux.so.2
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    84          result = DoMethodA (object, (Msg)&ops);
    (gdb) bt
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    #1  0x402bd919 in ?? ()
    #2  0x00317ceb in ?? ()
    #3  0x402f7504 in ?? ()
    #4  0x40289dfc in ?? ()
    #5  0x8042bfe0 in ?? ()
    #6  0x404ca36c in ?? ()

� ���� ������ ����������� ``findaddr`` ��� ������ ������, ������� �� ������
��������� (��������, ���� �������� ������� ����������)::

    (gdb) findaddr 0x402bd919
    Searching in the loaded modules...
    Address found in System:Tests/Zune/list1, which is loaded at 0x402bd454.
    If this is an executable, its .text section starts at 0x402bd460

����� �������������� �������� ``add-symbol-file`` ��� �������� ������� ��������
�� ���������� ������ ������ .text ������������ ������::

    (gdb) add-symbol-file Tests/Zune/list1 0x402bd460
    add symbol table from file "Tests/Zune/list1" at
            .text_addr = 0x402bd460
    (y or n) y
    Reading symbols from Tests/Zune/list1...done.

������ ����� ��������� ��������� ������::

    (gdb) bt
    #0  0x080c8830 in Intuition_SetAttrsA (object=0x317ceb, tagList=0x402f7504, 
        IntuitionBase=0x40289dfc) at setattrsa.c:84
    #1  0x402bd919 in main () at list1.c:107
    #2  0x402bd5d1 in __startup_entry (argstr=0x402bcd24 "\n", argsize=1, 
        sysbase=0x40232290) at startup.c:102
    #3  0x080580a7 in Dos_RunProcess (proc=0x403f76f0, sss=0x403daac4, 
        argptr=0x402bcd24 "\n", argsize=1, entry=0x402bd458, DOSBase=0x402a6888)
        at runprocess.c:123
    #4  0x0806a1c7 in Dos_RunCommand (segList=0x402bd454, stacksize=40960, 
        argptr=0x402bcd24 "\n", argsize=1, DOSBase=0x402a6888) at runcommand.c:107
    #5  0x40400461 in ?? ()
    #6  0x402bd454 in ?? ()
    #7  0x0000a000 in ?? ()
    #8  0x402bcd24 in ?? ()
    #9  0x00000001 in ?? ()
    #10 0x402a6888 in ?? ()

����� ������� ������, ��� �� ����� ������::

    (gdb) f 1
    #1  0x402bd919 in main () at list1.c:107
    107             set(3243243, MUIA_Window_Open, TRUE);

��������� �������� ��� ���������� �������, ������� �� ������ ���������.

������������� ������� thistask
------------------------------

��� ������� ������� ��������� ���������� � ���������� � ������ ������ ������.
��� ������ �� ����� ������ ����� � ``SysBase->ThisTask``::

    (gdb) thistask 
    Task     SigWait  SigRecvd StkSize   StkUsed Pri Type Name
    -----------------------------------------------------------------------------
    40231fb8 00000000 00000000    40960      872 -128    1 Idle Task

��������� � ��������
====================

���������� ���������� ���������� �� i386
----------------------------------------

���� �� �������� ��������::

    asm("int $3");

� ��� �� ��, �� ��������� �������������� �������� ����� ����������� �� �����
���������� ���������. ����� ��������� �������� � GDB, ��� ����� ����������� ���
�������� � ������������� ����� ������� ��� ���������� ����������� �������::

    if (byteSize == 112)
        asm("int $3");

--------------------
����������� ��������
--------------------

����������� �������� � ��� ����, ��� ��� ���� � ������ ������������ ��������,
���� �� �������� ��� AROS, ������� ��� �������������� ���� ����������� �������
�� �������������� ��������. ����� �� ������ ��������� �����������, �������
������� ��� ��������� ���� ���������.

����������� ������ ��� ������ Mungwall
======================================

���� AROS �������������� � ������ ``--enable-debug``, �� �������� Mungwall
�������. ��� ���� ��������� ��������� ������� ������ �� � ����� �������, 
���������� ����� ���������� ��� �������� ���������� ������ ��� ������ ���������
��������� �������. ��� �������� ���������� �� ����� �������� ��������� ������, 
��� � ����� ����� ������� ``AvailMem(MEMF_CLEAR)``.

������� ``CheckMem`` � ��������� ������ ������ �������� ��� ������� � �������
��������� �� �������� ��� ��������� ���������� ������ (���������������� ���� ���
native-������, ������� ��� hosted-������). ���� ����� �� ���������� �������
���������� ������ �� ���������, �� ����� �������� ������� ���������� ������� 
��������� ������ � � ��������� �����::

    === MUNGWALL MEMORY CHECK ============
    
    Num allocations: 1579   Memory allocated 3333326

LeakWatch
=========

��� �������, �� �������� ����������. �� ����������� ��� ������ � �����������
������� Exec: ����������, ����������, ������, �������, ����� � ��������. �� 
��������� ������� ������ �� ��������, ������� �� ������������, ��� ������ 
��������� ���������� ������ ����� ����, ��� ��������� ������� ����� �������.

��������� ``LeakWatch`` � ��� ����������� ��������, ��������� ���������
��������� ������:

+ ``Ctrl-C`` ��� ������
+ ``Ctrl-D`` ��� ������ �������� ��������� ��������
+ ``Ctrl-E`` ��� ������ ��������, ������������ � ������� ������� LeakWatch
+ ``Ctrl-F`` ��� ������ ��������, ������������ � ���������� ������� ``Ctrl-F``

``Ctrl-F`` �������� �������� �������� ����������, ���� ������ ��� ����� ��������
���������, � ����� - �����. � ����� ����� ��������, ��� ����� ��������� ������� 
�� ���� ������. 
� ��������� ������:

+ ���������, �� �������� �� ������� ������ ��������� � ������� ����� �������.
+ ��������� ������. ��������, ��� �� ������ ��������.
+ ���������� �����, ��� ����� ����� ������ �������� ��������� �����������, 
  ������� �� ����������� � ���������, � ����� ��������������� ��� ����� 
  ��������� ����.

���� �� �������, ��� ���� ��������� ���������� ������ � ���������� AROS, ��
������� ������������ ��� �������� ��������� �������� ���������, ���������� �
������������� ������, ����� ���������, ��� ������ ������������� ��������� �
����������.

��������� ����������� ���������� ��������������
===============================================

����� ���� ���������� ����������� ��� �������, ������� ����� ����� �� ``C:``.

�������� AROS
-------------

������� ``set __debug_mem`` � ��������� ������ ��� ��������� ������ ���������� �
��������� ������ �� � ����� ���������� ������ �������, � ����� ���������� ��
���������� ������. ����� ������ �� ``LeakWatch``, �� ������ ��� ������.

Avail
-----

����������� ``Avail`` ��� ������ ���������� � ������. �������� FLUSH ������ ��
������ �������������� �������.

Liblist
-------

���������� ������ �������� � ������ ������ ��������� � ��������� ���������� �
���, ����� ������ � �������� ��������.

Devlist
-------

���� ��� � ``Liblist``, ������ ��� ���������.

��������� � ��������
====================

�������� Mungwall � ������������
--------------------------------

�������� ��������� ��� ������������� ``Mungwall`` �������� ���������
������������ �� ����� ``AvailMem(MEMF_CLEAR)`` ��� ������ ������������ �����,
���� �� ������ �������� ����������� ������, �� �� ������ ��������� ��� �������
���������. �������� ������ ����� ������������� ����� ������ ��������� ������ 
������� ������ ������ �������. ��� ���������� ��������, �� � ���� ������ 
�������������� �� ����.

������ ������
-------------

+ ����������, ��������� ����� ������ ������� � ��� ����� � ������������: ��� ���������
  ������� ������ � ���������� ���������� ��������� ``checksum`` �� � �����
  ������� �������������� ���������, ����� ������� ������ ����������� ������ (��
  �������� �������� ����� ������ ``checksum``, ��� �������� �������������, ����
  ���������� ``__debug_mem``).

+ ����� ����������� �� ��������� � �������� �������� Mungwall'a:
  96 ���� ����������� � ������� ����������. ������ ``checksum`` ���� ���
  �������� ������� ����������.

+ ������ �������� �������� ``AllocVec()`` ��� ``AllocMem()``? �������� ���������
  ���� � ������� ``AllocVec`` �������������� ��� ������ ``rom/exec/allocvec.c`` 
  � ���������, ��������� �� ��������������� ������� ������ ������.

+ ����������� ���������� ���������� ������ � ������ �������� � ���
  �������������� ���������� (``asm("int $3")`` ��� ��������� i386) �
  ����������� ����� ���������� � ``rom/exec/allocvec.c`` ���
  ``rom/exec/allocmem.c``. �������, ��� ����� ��� ����������� ��������� ���� 
  ��������� � GDB. ����������� ``bt`` � ������ ������� GDB ��� ����������� 
  ������� ������� ��������������� ����������.

+ ���� �� ����� ��������� ����� ������, �������� ��� ������ ���������
  (��������, �������� ���������� ������ � ����� ����������� � ������ ���������)
  � ���������, ���������� �� ��������������� ������� ������ ������. 
