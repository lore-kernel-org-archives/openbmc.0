Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s9mdY2PcKzDr1k
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 23:56:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7CDsTnM143414
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 09:56:30 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24s2unpjjw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 09:56:29 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 12 Aug 2016 07:56:29 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 12 Aug 2016 07:56:27 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: tomjose@linux.vnet.ibm.com
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 57E903E40048
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 07:56:27 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7CDuRkr10158524
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 06:56:27 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FF116A03B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 07:56:27 -0600 (MDT)
Received: from [9.109.165.37] (unknown [9.109.165.37])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 220B96A03F
 for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2016 07:56:25 -0600 (MDT)
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: Discussion on openbmc issue #430
To: openbmc@lists.ozlabs.org
Date: Fri, 12 Aug 2016 19:26:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000908040204030107060005"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16081213-0024-0000-0000-00001450DDAA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005582; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000181; SDB=6.00743675; UDB=6.00350218; IPR=6.00516212; 
 BA=6.00004660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012326; XFM=3.00000011;
 UTC=2016-08-12 13:56:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16081213-0025-0000-0000-000043801E42
Message-Id: <57ADD588.7080000@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=13
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608120148
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2016 13:56:34 -0000

This is a multi-part message in MIME format.
--------------000908040204030107060005
Content-Type: multipart/alternative;
 boundary="------------090904020209050907080102"


--------------090904020209050907080102
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

*Design and Implement Framework for IPMI backend*
------------------------------------------------------------------------------
The purpose of this is to come up with a mechanism to share providers 
between the host-ipmid and the rmcp-ipmid.
Also, update existing providers and host-ipmid to fit this framework. 
Demo of this story should be to use an existing
host-ipmid provider via the rmcp path.


*Registering Callback Routines:-*
-----------------------------------------------
1) Open the IPMI library path(/usr/lib/phosphor-host-ipmid)
2) Scan for libraries that end with .so
3) Do a dlopen that would register the handlers for the callback routines.
The data that is currently registered for each command: Net Function, 
Command and Functor.

*Additional Metadata needed per command:-*
-----------------------------------------------------------------

*SessionLess Commands :-
*-------------------------------------*
*
This would mention whether the command can be executed without a 
session. For example
Get Channel Capabilities can be executed without a session.

*Minimum Privilege Required to Execute the command :-
*---------------------------------------------------------------------------------*

*This field would mention the minimum privilege of the session required 
to execute the
command. Before executing any command on a session, the command would be 
executed
only if the command privilege level is less than or equal to session 
privilege level.
The privilege levels are Administrator, Operator, User and Callback and OEM

*Firmware Firewalling :-
*--------------------------------*

**Channel Restriction :-
*------------------------------*

*The channel restriction can be applied if certain command needs to be 
restricted on System
Interface or LAN Interface.

The Get NetFn/ Command support can be used to get a list of commands 
that are supported
on a given channel. Implementation of these commands is not in the scope 
of this story.

*Command Firewalling:-
*--------------------------------*

*Configuration of Firmware Firewall capabilities is supported by 
commands that allow software to enable/disable individual commands.
The Firmware Firewall capability does not affect the operation of user 
and channel privileges.
That is, if a command requires Admin privilege level to be executed, it 
will still require Admin privilege if enabled by Firmware Firewall.

The different values that are supported for this field is:
a) Command is supported by default(can be configured(enabled or disabled)
b) Supported and cannot be configured( enable/disable is restricted)
c) Disabled by default but can be configured.

The firmware firewalling commands once supported would support the above 
operations.


Regards,
Tom

--------------090904020209050907080102
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <b>Design and Implement Framework for IPMI backend</b><br>
------------------------------------------------------------------------------<br>
    The purpose of this is to come up with a mechanism to share
    providers between the host-ipmid and the rmcp-ipmid.<br>
    Also, update existing providers and host-ipmid to fit this
    framework. Demo of this story should be to use an existing <br>
    host-ipmid provider via the rmcp path.<br>
    <br>
    <br>
    <b>Registering Callback Routines:-</b><br>
    -----------------------------------------------<br>
    1) Open the IPMI library path(/usr/lib/phosphor-host-ipmid)<br>
    2) Scan for libraries that end with .so<br>
    3) Do a dlopen that would register the handlers for the callback
    routines.<br>
    The data that is currently registered for each command: Net
    Function, Command and Functor.<br>
    <br>
    <b>Additional Metadata needed per command:-</b><br>
    -----------------------------------------------------------------<br>
    <br>
    <b>SessionLess Commands :-<br>
    </b>-------------------------------------<b><br>
    </b><br>
    This would mention whether the command can be executed without a
    session. For example<br>
    Get Channel Capabilities can be executed without a session.<br>
    <br>
    <b>Minimum Privilege Required to Execute the command :-<br>
    </b>---------------------------------------------------------------------------------<b><br>
      <br>
    </b>This field would mention the minimum privilege of the session
    required to execute the<br>
    command. Before executing any command on a session, the command
    would be executed<br>
    only if the command privilege level is less than or equal to session
    privilege level.<br>
    The privilege levels are Administrator, Operator, User and Callback
    and OEM<br>
    <br>
    <b>Firmware Firewalling :-<br>
    </b>--------------------------------<b><br>
      <br>
    </b><b>Channel Restriction :-<br>
    </b>------------------------------<b><br>
      <br>
    </b>The channel restriction can be applied if certain command needs
    to be restricted on System<br>
    Interface or LAN Interface.<br>
    <br>
    The Get NetFn/ Command support can be used to get a list of commands
    that are supported<br>
    on a given channel. Implementation of these commands is not in the
    scope of this story.<br>
    <br>
    <b>Command Firewalling:-<br>
    </b>--------------------------------<b><br>
      <br>
    </b>Configuration of Firmware Firewall capabilities is supported by
    commands that allow software to enable/disable individual commands.<br>
    The Firmware Firewall capability does not affect the operation of
    user and channel privileges. <br>
    That is, if a command requires Admin privilege level to be executed,
    it will still require Admin privilege if enabled by Firmware
    Firewall.<br>
    <br>
    The different values that are supported for this field is:<br>
    a) Command is supported by default(can be configured(enabled or
    disabled)<br>
    b) Supported and cannot be configured( enable/disable is restricted)<br>
    c) Disabled by default but can be configured.<br>
    <br>
    The firmware firewalling commands once supported would support the
    above operations.<br>
    <br>
    <br>
    Regards,<br>
    Tom<br>
  </body>
</html>

--------------090904020209050907080102--

--------------000908040204030107060005
Content-Type: application/pdf;
 name="IPMI Provider Integration.pdf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="IPMI Provider Integration.pdf"

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
t5YadklCXDrETHmFdW5UMWYHsTISYCYekqCqMP+I3I8KSBq+xB6lMrdNtSuqEJypXEay95hQ
W75TJcw2G6uCfwa5WtYnKQPocnsvJUlVUs2EWlW9dpNz1YCZOBLXbXW6p4hzRhwdEDL3rQjW
5pXeu16sVdm+77BYk5GLKQFhl2DL27/QeE19tjp/uKYgQe4Hnh3ioxJU7FUxXgo7V1HPDT4I
CoEyHisvnwO/vZY3zI6LcmQYXD5bCEToBXegWd7ODwAgDNsMW9SbKigLmMBYswTOVLNX6ZSF
KwCSd6zWvPNysxomb7cKadjgQ3oPoxL3neL3ziuuTSxI/lF8y6t0wW+jyh5VrXJ6OnAEmq88
7mP3uftw//Z73336s/vw9mXolj+6jy9/AwX+AhkKZW5kc3RyZWFtCmVuZG9iagoKMyAwIG9i
agoyMDY0CmVuZG9iagoKNCAwIG9iago8PC9UeXBlL1hPYmplY3QKL1N1YnR5cGUvRm9ybQov
QkJveFsgLTExMiA0MjAgNzA4IDQyMC4xIF0KL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1Mv
RGV2aWNlUkdCL0sgdHJ1ZT4+Ci9MZW5ndGggOAovRmlsdGVyL0ZsYXRlRGVjb2RlCj4+CnN0
cmVhbQp4nAMAAAAAAQplbmRzdHJlYW0KZW5kb2JqCgo1IDAgb2JqCjw8L0NBIDAuNQogICAv
Y2EgMC41Cj4+CmVuZG9iagoKNyAwIG9iago8PC9MZW5ndGggOCAwIFIvRmlsdGVyL0ZsYXRl
RGVjb2RlPj4Kc3RyZWFtCniclVZNi9swEL37V+hciFejD8uCYEjsuNBbaKCHsre2e2vZ9NC/
35FGn/auncWE2NJI8+a9mZF4C+xf88o44/imrW4F6xW0Pbv/bL59Yr9pDp/7S3O+NbrDKWMk
Gt9+sKdZMJDs9uv7kZ+Ggzhyy88D/o3AAfxA7z6Vf9WDwhk00cNBhkEQQ38kU9BgaVAYUHzC
HdVqKqydQDgTkPhT3AQrSy4uAcnM5zCBxuiGIILxOwiHSxbIxORGpuFgAuj5vRhWlhQJH0yE
ayEGeRl0GORdjAUxWwxvhJmMMALr4JGHUw4TBEYx4vvz7UtzuTXXN8XQPWpWixE8ngfojyQI
7U3MjFGJMnz01IVPF1PYYUScFmFQMEFc+jCJ0WJZwA0uaqdQJoHLpIUIhAW5OlpJYgaZYUxs
qKiYHsBG3SI8r4HfJaTLKZj6JCngekgJTsqPnHwZbZZUcm5wl0L+KI7GdT2umF0m7gmk5Eqg
7aAJcc4JkAVjDiIVkXK5VChINmf81zFIw8OeoBI1nqwxOOHOfdr3RHlRDm2xsebBrdgJTZEw
B1WhFrnQc9hBERyc9zgWfSsXHH+4oKtizpWM6bflurN9q5byLroLFfm0LsjCowh1CTJ1M0NS
Fh3BFW0qTZ3646rLnoL6HT6WZseaVEJhi6r1DWFK3lQwmWLupZVTqnxx3qam61v9ZmsSkNyK
nXKsEO3EpWKueMJzTz3njmaQ11F0Q+yG0V9MtbyoahZoQGxgJptSNkV77WdxxbXLhnwiLc44
3BO2edVyzavGRbGohB3epSm1zIpptaAjHT3LJvMIHw/Udjriq/iX5Ffar9rwGBpNOtYeZE/2
bbcs2MsiK+GyKdAHci3zrX07Xt4LtlJPL5le3jmc373+xPvW7PenWOxbnXJptmqV/l42VvDr
W1ipp4vM25Tb7xc4x3FTdCN/ZtUL8q2gvuOkC5iFx68+4QaSKL6yV/Z0+fwVOHv5y55ud8um
P+za/AcZyGddCmVuZHN0cmVhbQplbmRvYmoKCjggMCBvYmoKNzQ5CmVuZG9iagoKOSAwIG9i
ago8PC9UeXBlL1hPYmplY3QKL1N1YnR5cGUvRm9ybQovQkJveFsgLTExMiA0MjAgNzA4IDQy
MC4xIF0KL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0sgdHJ1ZT4+Ci9M
ZW5ndGggOAovRmlsdGVyL0ZsYXRlRGVjb2RlCj4+CnN0cmVhbQp4nAMAAAAAAQplbmRzdHJl
YW0KZW5kb2JqCgoxMCAwIG9iago8PC9DQSAwLjUKICAgL2NhIDAuNQo+PgplbmRvYmoKCjEy
IDAgb2JqCjw8L0xlbmd0aCAxMyAwIFIvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aDEgMjIw
OTY+PgpzdHJlYW0KeJzdvAl0VMeVMFy33nu9L693tVqt7ua91taSWqglkBBqPYSWBoFpQGAh
WagFkkBsEpLAWxxkA8YGe0xiTLzFJj6M49jOuMGMgxPHKHPsTHISx2TiZJKxHSsTssxnEzMe
4s+/Ma3/1usWi5PMnPN//zn/OX+jflV169Z26671qpkY2zVITGSScETZuL1/dN2O/lWEkB8T
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
2qNmW1vfQ7Dnyw98mY7ePXn34bu5yf2H99MXdp/ZTceTpYGRHZHAjvaygDeWt0Yb49ZouBn1
B8ktG8Ilbak+JdCHSD3dVYHu9tKAI2ZfI+BkeUS0cgGuiVvBjXAPcGc4rW5VsjCwEr/TyQtJ
al0RWBFdof5Oqb8jhB0tHV06uZRb0lYaSLTXBaztgfZo+5vt77V/2K7pa4cn8a/thbYzbZzS
VhptU9oKQ20FCd8ad8y1RoxZ11AgayBG1kStM1ZqtfZZ91jZxTLCfjgmwGk4fKJzdSTScVo7
s6ojrUv2pOGedHg1eyoru9Oae9JkTXdP1wmAv1u3//77SbO/I129uiud8q/rSA9gRmGZScyI
/hNu0rxufHxCvcMIkQhmd+GTRHYhaP14Fkgis9UkMg7j42R8HCKsTs0ihIxHGJhBWBvAluvH
CXuw2oiKxXLj43nr/28yZPqOCmVuZHN0cmVhbQplbmRvYmoKCjEzIDAgb2JqCjE1MTgwCmVu
ZG9iagoKMTQgMCBvYmoKPDwvVHlwZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9DQUFBQUEr
TGliZXJhdGlvblNlcmlmCi9GbGFncyA0Ci9Gb250QkJveFstMTc2IC0zMDMgMTAwNSA5ODFd
L0l0YWxpY0FuZ2xlIDAKL0FzY2VudCA4OTEKL0Rlc2NlbnQgLTIxNgovQ2FwSGVpZ2h0IDk4
MQovU3RlbVYgODAKL0ZvbnRGaWxlMiAxMiAwIFIKPj4KZW5kb2JqCgoxNSAwIG9iago8PC9M
ZW5ndGggNDUwL0ZpbHRlci9GbGF0ZURlY29kZT4+CnN0cmVhbQp4nF2TTY+bMBCG7/wKH7eH
FTA2sCtFSFmykXLoh5rtDyDgpEgNIEIO+ff1O6/bSj0kemzPjB+PhrQ57A7jsKbflqk7+tWc
h7Ff/G26L503J38ZxiQX0w/dGlf6313bOUlD7vFxW/31MJ6nzSZJv4ez27o8zNO2n07+U5J+
XXq/DOPFPP1ojmF9vM/zL3/142qypK5N78+hzud2/tJefapZz4c+HA/r4zmk/Av4eMzeiK5z
qnRT729z2/mlHS8+2WRZbTb7fZ34sf/vrBCmnM7dz3YJoXkIzTK7qwOLcuHAVrl8ATtyAS6U
JQOXypVyRdaYF7KAX5m7B2+5b8Fv3C/BDff13h33X8HvZI3fk+GZZ4yvwPQvczD9y3cw/SvU
z6M/6uf0L+GW01+0Jv1Fc+nvtGb0b8D0F2X6V+hPTv9SfaL/G5j+Tu+lf4V3Cf0t6gv9Rffp
79Arob/TffoX6LPQ38FZoj8cJPprLv0t3ij0L9BDob9Vpr/dgunv8Hahv0PfJPprPP0d3mhj
/+Fv6e9wl43zgxmw0V+Z/q7RgYyTh9HEt/Nn5E13X5Yw7vqB6ZxjwofR//0G52lGlv5+A+/j
5PsKZW5kc3RyZWFtCmVuZG9iagoKMTYgMCBvYmoKPDwvVHlwZS9Gb250L1N1YnR5cGUvVHJ1
ZVR5cGUvQmFzZUZvbnQvQ0FBQUFBK0xpYmVyYXRpb25TZXJpZgovRmlyc3RDaGFyIDAKL0xh
c3RDaGFyIDUyCi9XaWR0aHNbMzY1IDU2MyA2MTAgNTAwIDQ0MyAyNTAgNTAwIDUwMCAzMzMg
NTAwIDM4OSAzMzMgMjc3IDI3NyA0NDMgNzc3CjcyMiA0NDMgNTAwIDUwMCA1MDAgNTAwIDMz
MyAyNTAgNzIyIDI3NyAyNTAgNTAwIDUwMCA1MDAgNzIyIDUwMAo1MDAgMzMzIDcyMiAzMzMg
NTU2IDg4OSAzMzMgMjc3IDUwMCA1NTYgNTAwIDI3NyA3MjIgNTU2IDY2NiA3MjIKNTAwIDY2
NiA3MjIgNjEwIDYxMCBdCi9Gb250RGVzY3JpcHRvciAxNCAwIFIKL1RvVW5pY29kZSAxNSAw
IFIKPj4KZW5kb2JqCgoxNyAwIG9iago8PC9MZW5ndGggMTggMCBSL0ZpbHRlci9GbGF0ZURl
Y29kZS9MZW5ndGgxIDE3OTY4Pj4Kc3RyZWFtCnic3XsNWBvXleg9d0b/Ehr9DUKDpBGDECBA
GJk/yzYy5keAjTFgB7AxYAOGODYYiGMnaU1aJ05I07htNps028bNpmmycWs5cRNn221o6+Zt
f9K427TdNE3j7Wbztq9hnW7TbhoH8c4dCRun2d333r7ve9/3hDRz7rnnnHvvueeec+6dYWbq
xhFiJrOEI/E9+4cmf/TVU39LCPkBIWDfc2hGPhnfpyB8kRCqHZ3cu78w+uq/EML9MyE6zd4b
joy6ui98jRDj24SUvTs2MjT83SphNSG1WE+qxhCxP3VER8gaGcv5Y/tnDv+T3fIZLDdg+S9u
mNgzRH9X8jMso3zSsX/o8OSNmj/nCImVY1k+MLR/5J8KFvKw3EGIfnJyYnrm2yR/iZCN86x+
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
ZW5kb2JqCgoxOCAwIG9iagoxMjIxOQplbmRvYmoKCjE5IDAgb2JqCjw8L1R5cGUvRm9udERl
c2NyaXB0b3IvRm9udE5hbWUvQkFBQUFBK0xpYmVyYXRpb25TZXJpZi1Cb2xkCi9GbGFncyA0
Ci9Gb250QkJveFstMTgyIC0zMDMgMTA4MyAxMDA3XS9JdGFsaWNBbmdsZSAwCi9Bc2NlbnQg
ODkxCi9EZXNjZW50IC0yMTYKL0NhcEhlaWdodCAxMDA3Ci9TdGVtViA4MAovRm9udEZpbGUy
IDE3IDAgUgo+PgplbmRvYmoKCjIwIDAgb2JqCjw8L0xlbmd0aCAzOTEvRmlsdGVyL0ZsYXRl
RGVjb2RlPj4Kc3RyZWFtCnicXZLNboMwDIDvPEWO26GChN9KCKmlReKwH43tASiYDmkElNID
b7/YzjZph1ZfnNj5cOyX9anW4+q/mrlrYBXDqHsDt/luOhAXuI7ak0r0Y7e6Ff13U7t4vs1t
ttsKU62HOc89/83u3VaziYdDP1/g0fNfTA9m1Ffx8FE2dt3cl+ULJtCrCLyiED0Mts5Tuzy3
E/iUtat7uz2u286m/B143xYQitaSVbq5h9vSdmBafQUvD4JC5FVVeKD7f3thximXoftsjT0q
7dEgiKLCsiJOYuSQOA2RI47vkWPmFDlhPiOnxCpAzjgukffMVP/Ad1GdI8dPyCXfRbknjpfI
Z45TbsW5iWUZcFwhs3+KPtL5V8jsnxyRnT/lsn+Md0n2j9BBsn9CNZ0/frtk/5jizp/i7J9i
ryT7hwdk9ldUk/1DYuePPVHsH2Md5fqP36vYP0VP5fpP59k/wrsU+6cZsut/Rg/tXhSfHGfy
Z5REdzfGjhENLs0PTs6o4Xe2l3nBLPp9A+nFxBsKZW5kc3RyZWFtCmVuZG9iagoKMjEgMCBv
YmoKPDwvVHlwZS9Gb250L1N1YnR5cGUvVHJ1ZVR5cGUvQmFzZUZvbnQvQkFBQUFBK0xpYmVy
YXRpb25TZXJpZi1Cb2xkCi9GaXJzdENoYXIgMAovTGFzdENoYXIgMzgKL1dpZHRoc1szNjUg
NzIyIDQ0MyAzODkgMjc3IDUwMCA1NTYgMjUwIDUwMCA1NTYgMzg5IDgzMyA1NTYgMjc3IDMz
MyA2MTAKNDQzIDcyMiA1MDAgNTU2IDMzMyA2MTAgOTQzIDU1NiA0NDMgNzIyIDcyMiA1NTYg
MzMzIDMzMyA1NjkgNzIyCjU1NiA2NjYgNTAwIDU1NiA2NjYgNTAwIDU1NiBdCi9Gb250RGVz
Y3JpcHRvciAxOSAwIFIKL1RvVW5pY29kZSAyMCAwIFIKPj4KZW5kb2JqCgoyMiAwIG9iago8
PC9GMSAyMSAwIFIvRjIgMTYgMCBSCj4+CmVuZG9iagoKMjMgMCBvYmoKPDwvRm9udCAyMiAw
IFIKL1hPYmplY3Q8PC9UcjQgNCAwIFIvVHI5IDkgMCBSPj4KL0V4dEdTdGF0ZTw8L0VHUzEw
IDEwIDAgUi9FR1M1IDUgMCBSPj4KL1Byb2NTZXRbL1BERi9UZXh0L0ltYWdlQy9JbWFnZUkv
SW1hZ2VCXQo+PgplbmRvYmoKCjEgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCAxMSAwIFIv
UmVzb3VyY2VzIDIzIDAgUi9NZWRpYUJveFswIDAgNTk1IDg0Ml0vR3JvdXA8PC9TL1RyYW5z
cGFyZW5jeS9DUy9EZXZpY2VSR0IvSSB0cnVlPj4vQ29udGVudHMgMiAwIFI+PgplbmRvYmoK
CjYgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCAxMSAwIFIvUmVzb3VyY2VzIDIzIDAgUi9N
ZWRpYUJveFswIDAgNTk1IDg0Ml0vR3JvdXA8PC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VS
R0IvSSB0cnVlPj4vQ29udGVudHMgNyAwIFI+PgplbmRvYmoKCjExIDAgb2JqCjw8L1R5cGUv
UGFnZXMKL1Jlc291cmNlcyAyMyAwIFIKL01lZGlhQm94WyAwIDAgNTk1IDg0MiBdCi9LaWRz
WyAxIDAgUiA2IDAgUiBdCi9Db3VudCAyPj4KZW5kb2JqCgoyNCAwIG9iago8PC9UeXBlL0Nh
dGFsb2cvUGFnZXMgMTEgMCBSCi9PcGVuQWN0aW9uWzEgMCBSIC9YWVogbnVsbCBudWxsIDBd
Ci9MYW5nKGVuLUlOKQo+PgplbmRvYmoKCjI1IDAgb2JqCjw8L0NyZWF0b3I8RkVGRjAwNTcw
MDcyMDA2OTAwNzQwMDY1MDA3Mj4KL1Byb2R1Y2VyPEZFRkYwMDRDMDA2OTAwNjIwMDcyMDA2
NTAwNEYwMDY2MDA2NjAwNjkwMDYzMDA2NTAwMjAwMDM0MDAyRTAwMzI+Ci9DcmVhdGlvbkRh
dGUoRDoyMDE2MDgxMjE2MDcwOSswNSczMCcpPj4KZW5kb2JqCgp4cmVmCjAgMjYKMDAwMDAw
MDAwMCA2NTUzNSBmIAowMDAwMDMzMzM3IDAwMDAwIG4gCjAwMDAwMDAwMTkgMDAwMDAgbiAK
MDAwMDAwMjE1NCAwMDAwMCBuIAowMDAwMDAyMTc1IDAwMDAwIG4gCjAwMDAwMDIzNTQgMDAw
MDAgbiAKMDAwMDAzMzQ4MSAwMDAwMCBuIAowMDAwMDAyMzk0IDAwMDAwIG4gCjAwMDAwMDMy
MTQgMDAwMDAgbiAKMDAwMDAwMzIzNCAwMDAwMCBuIAowMDAwMDAzNDEzIDAwMDAwIG4gCjAw
MDAwMzM2MjUgMDAwMDAgbiAKMDAwMDAwMzQ1NCAwMDAwMCBuIAowMDAwMDE4NzIxIDAwMDAw
IG4gCjAwMDAwMTg3NDQgMDAwMDAgbiAKMDAwMDAxODk0MSAwMDAwMCBuIAowMDAwMDE5NDYx
IDAwMDAwIG4gCjAwMDAwMTk4MzIgMDAwMDAgbiAKMDAwMDAzMjEzOCAwMDAwMCBuIAowMDAw
MDMyMTYxIDAwMDAwIG4gCjAwMDAwMzIzNjUgMDAwMDAgbiAKMDAwMDAzMjgyNiAwMDAwMCBu
IAowMDAwMDMzMTQ2IDAwMDAwIG4gCjAwMDAwMzMxODkgMDAwMDAgbiAKMDAwMDAzMzczMSAw
MDAwMCBuIAowMDAwMDMzODI5IDAwMDAwIG4gCnRyYWlsZXIKPDwvU2l6ZSAyNi9Sb290IDI0
IDAgUgovSW5mbyAyNSAwIFIKL0lEIFsgPEVCMzUxMTRGNjUwOERDMEJEOTEwODgxNzIzNzgw
NTdEPgo8RUIzNTExNEY2NTA4REMwQkQ5MTA4ODE3MjM3ODA1N0Q+IF0KL0RvY0NoZWNrc3Vt
IC9CNUU3NTJBNzkyQjU4OTI4MDM4ODA4OTkzOTExNzVDNAo+PgpzdGFydHhyZWYKMzQwMDQK
JSVFT0YK
--------------000908040204030107060005--
