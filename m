Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22f; helo=mail-qt0-x22f.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRVJiIxF"; 
 dkim-atps=neutral
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7v236rFqzDqhg
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 02:38:31 +1100 (AEDT)
Received: by mail-qt0-x22f.google.com with SMTP id o52so32132556qtc.9
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=B6jLrZeeDWjzXuToFR29ibGu568YACe3uO0z0XIfqOE=;
 b=nRVJiIxFeLP4tzSOieo76OzXMgbI1Vl0ZzBtjYJg+8lKun+G0+YTAxIHJ+q7fVPp0c
 GyRDWMOZOm6yqAZE2dtWLQKUfsSET6YRbpX1trFNlifxLD07WtBm0nAnEcw0GzNw2Irw
 kd6pWzKT3tWdfQ0RWqW1cx0srClruRnrQAVwngwC8zMswCuBtKXlBp5F1jUAWJD8txXo
 hv3i3YGbyVLQOctPmdgyfjswYttqG2VlOXttZsyyyXevdNSGWouuABr7qWyM7vRoLJ0b
 XvqHVuoC6n+y7aLqGHW4vBnWd6i3ZJ7ROC+J5Kx3zZlRJ7ymR74PSContHiQzHDnqT88
 P3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=B6jLrZeeDWjzXuToFR29ibGu568YACe3uO0z0XIfqOE=;
 b=Tc9BRPeb3QSXoFWFEg5QolwgNz9NTm6qBmDYfeOkfIiaY4rAOyv0TaFaCTYmFOJwcv
 VG4fsoWTfYlLnIsZMX8mDRUPNufIPwEzZ+3Qg0itcfFOopL+7Z/MzwOt69X/kjp6vQ2x
 3yC823/AcvcESpBOAf6HXmPMwT2b22ZC0E9Xnoq10m5PzLDeDmhkCcYR1w51FyLDG9he
 eKopoNH2buBiN5A8+m8nsIeEt22KkaAJygIAmmdr1L8OJVxlbkN9ey8AD2lrSH8HLZi5
 p+oMIvv8mxdZxseQx+CLnCYgrrOHJKBEe/XucQV38C+qMB2L/Ee4iU2FC6MI04O5XUQO
 2riA==
X-Gm-Message-State: AMCzsaUcCnrR3KiWqphUWz9xbK0G8Yk++PdSd1X9k3OvGpBNzGdtQ+/K
 ceNhr53dkUqqbtp/nPpwA7+KvK7OJ5RLOaB7b2dyhfw7
X-Google-Smtp-Source: AOwi7QASjOqumQ9h4who/Y4uRLqdC1yBkqvPBZZetf3wQnwvcmCDGk+8VUVbRzk4J39rEw1/rsF9msqq4yWB4wjI4Xg=
X-Received: by 10.237.41.70 with SMTP id s64mr3664282qtd.71.1507304309372;
 Fri, 06 Oct 2017 08:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.180.159 with HTTP; Fri, 6 Oct 2017 08:38:28 -0700 (PDT)
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 6 Oct 2017 12:38:28 -0300
Message-ID: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
Subject: OpenBMC on Raspberry PI 3.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c06a072edbba6055ae2a10f"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 15:39:08 -0000

--94eb2c06a072edbba6055ae2a10f
Content-Type: text/plain; charset="UTF-8"

Hi People,

I'm building an OpenBMC image for target Palmetto on Ubuntu 16.04 to try to
make it work on the Raspberry PI 3. I've followed these steps:


*1.  *sudo apt-get install -y git build-essential libsdl1.2-dev texinfo
gawk chrpath diffstat

*2.* git clone git@github.com:openbmc/openbmc.git

*3.* cd openbmc

*4-* export TEMPLATECONF=meta-openbmc-machines/meta-
openpower/meta-ibm/meta-palmetto/conf

*tester@obmc:/openbmc$* . oe-init-build-env ~/my-build

*tester@obmc:~/my-build$* bitbake obmc-phosphor-image

*tester@obmc:/$* cd /home/tester/my-build/tmp/deploy/images/palmetto/

*tester@obmc:/$* tar -xvf
obmc-phosphor-image-palmetto-20171005142206.static.mtd.all.tar

*tester@obmc:/$* ls -lha
total 65M
drwxr-xr-x  2 root   root   4.0K Oct  5 15:37 .
drwxr-xr-x 24 root   root   4.0K Oct  5 10:29 ..
*-rw-rw-r--  1 tester tester  32M Oct  5 14:03 image-bmc*
-rw-rw-r--  2 tester tester  33M Oct  5 14:03
obmc-phosphor-image-palmetto-20171005142206.static.mtd.all.tar


Would like to know if it is the *image-bmc* file, what I will have to flash
on the SD card of the Raspberry to load OpenBMC.

Have also build an image of Linux Yocto for Raspberry PI 3.

Thanks for your attention.

Regards,




*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*

--94eb2c06a072edbba6055ae2a10f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi People,<br><br></div>I&#39;m building an OpenBMC i=
mage for target Palmetto on Ubuntu 16.04 to try to make it work on the Rasp=
berry PI 3. I&#39;ve followed these steps:<br><br><div><div><br><b>1.=C2=A0=
 </b>sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk=
 chrpath diffstat<br><br><b>2.</b> git clone git@github.com:openbmc/openbmc=
.git<br><br><b>3.</b> cd openbmc<br><br><b>4-</b> export TEMPLATECONF=3Dmet=
a-openbmc-machines/meta-<br>openpower/meta-ibm/meta-palmetto/conf<br><b><br=
>tester@obmc:/openbmc$</b> . oe-init-build-env ~/my-build<b><br><br>tester@=
obmc:~/my-build$</b> bitbake obmc-phosphor-image<br><br><b>tester@obmc:/$</=
b> cd /home/tester/my-build/tmp/deploy/images/palmetto/<b><br><br>tester@ob=
mc:/$</b> tar -xvf obmc-phosphor-image-palmetto-20171005142206.static.mtd.a=
ll.tar<br><br><b>tester@obmc:/$</b> ls -lha<br>total 65M<br>drwxr-xr-x=C2=
=A0 2 root=C2=A0=C2=A0 root=C2=A0=C2=A0 4.0K Oct=C2=A0 5 15:37 .<br>drwxr-x=
r-x 24 root=C2=A0=C2=A0 root=C2=A0=C2=A0 4.0K Oct=C2=A0 5 10:29 ..<br><span=
 style=3D"color:rgb(255,0,0)"><i><b>-rw-rw-r--=C2=A0 1 tester tester=C2=A0 =
32M Oct=C2=A0 5 14:03 image-bmc</b></i></span><br>-rw-rw-r--=C2=A0 2 tester=
 tester=C2=A0 33M Oct=C2=A0 5 14:03 obmc-phosphor-image-palmetto-2017100514=
2206.static.mtd.all.tar<br><br><br></div><div>Would like to know if it is t=
he <span style=3D"color:rgb(255,0,0)"><b>image-bmc</b></span> file, what I =
will have to flash on the SD card of the Raspberry to load OpenBMC.<br><br>=
</div><div>Have also build an image of Linux Yocto for Raspberry PI 3.<br><=
/div><div><br></div><div>Thanks for your attention.<br><br></div><div>Regar=
ds,<br><br><br></div><div><br clear=3D"all"><div><div class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Romero<br=
></b></i></div><div style=3D"text-align:left"><span style=3D"color:rgb(19,7=
9,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"color:r=
gb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,255)"><a href=3D"m=
ailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></span><br>=
</b></i></span></div><div style=3D"text-align:left"><i><b><span style=3D"co=
lor:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <span sty=
le=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xavinux</=
span><br></u></span></span></b></i></div><div style=3D"text-align:left"><br=
></div> </div></div></div>
</div></div></div>

--94eb2c06a072edbba6055ae2a10f--
