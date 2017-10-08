Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::236; helo=mail-qk0-x236.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbIyphZM"; 
 dkim-atps=neutral
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y8rQr0xpqzDqG2
 for <openbmc@lists.ozlabs.org>; Sun,  8 Oct 2017 15:45:22 +1100 (AEDT)
Received: by mail-qk0-x236.google.com with SMTP id s14so7858773qks.6
 for <openbmc@lists.ozlabs.org>; Sat, 07 Oct 2017 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=g4arnub8BAto5ws9Na0NAy8OdR3+afmuMvTZZ+PUZoc=;
 b=TbIyphZMHIZsA2wKf/xhg52B1i5bbRaetukAP5nekWWCcoBuCxsuSxIfS2CIFVN0r1
 QxFQh2py4QkwgoxxZcfnMjYfYnVY9oB7pPBCCDw2NKkZne/K2fEk+DExJpUz9/HFmKES
 pI2OifOTClDz/QS7GDSWVZI07+q8rSYqQQq6IasB1mZJBVBCAOHPVn02yDAnqGdrj5Kv
 fuPLX8ohzM7jE89XWJ5N29haNuzKHIqE9FjpNHmcNdxogiUHiSDKoyqpvvSNWZlO0Elg
 njkjnXJTLPmXhjaKUE6ep9AX01wJZAJJLqdgsWFsG8ccbyhULEiYGzlP+gwn+xMwPLBa
 2Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=g4arnub8BAto5ws9Na0NAy8OdR3+afmuMvTZZ+PUZoc=;
 b=liPztBALqZuMVWHnmA/0D+oqxO3WeckNDjGt0u4uFRDUJ8x6xC/rv6Tpr3PviZ7Ua2
 LmNcV/rVwYjFOjTSk31VRfYRwva+9SbiEnTfna66EmN72+bm0Y5fdPWsqdRQLWoy8Ks8
 +4zG+OQNgbiCx2/HJe8FoE46l/gh5Ed7Jy2WBF2lOsbEaOF/AYkip8uRyqJy0M3Co1C0
 gsr1qa4KHnEQ6g1CckEULtScMxrNIH6JWHakwzM6VEw9eWfRzTGQex2E5tfTT9tpBRK7
 GKRqVi5HUcsaruoqtdzFednTaIWH0S8M/guPI0DmkD2P3n0+/Agb2YHy6f2Z3aQY+Q1i
 +eNA==
X-Gm-Message-State: AMCzsaVE+A/vA2gXmz/QMtA2kTeypCUYL61voOPVycRQWmR/A539voXy
 /FQJeAUF5N1Uhr3CwI5Sl51u+nTETbP97ZeMaTE=
X-Google-Smtp-Source: AOwi7QBmbKZPUOQGtFmKVINc8j//NLBuXpcttUtx7HpXJWbf0RGMg4b5bFHza8Ph0vDSS6EzUkO/jYJ7bfX3C+vnAjA=
X-Received: by 10.55.43.75 with SMTP id r72mr4339620qkh.307.1507437919955;
 Sat, 07 Oct 2017 21:45:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Sat, 7 Oct 2017 21:45:19 -0700 (PDT)
In-Reply-To: <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
From: Javier Romero <xavinux@gmail.com>
Date: Sun, 8 Oct 2017 01:45:19 -0300
Message-ID: <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1147732ebd77e8055b01bd4c"
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
X-List-Received-Date: Sun, 08 Oct 2017 04:45:25 -0000

--001a1147732ebd77e8055b01bd4c
Content-Type: text/plain; charset="UTF-8"

I've tried these steps:

*1. tester@obmc:~$ *cd openbmc

*2. tester@obmc:/openbmc$ *export
TEMPLATECONF=meta-openbmc-machines/meta-evb/meta-evb-raspberrypi/conf

*3. tester@obmc:/openbmc$ *. oe-init-build-env ~/my-build-raspberrypi

*4. tester@obmc:~/my-build-raspberrypi$ *bitbake obmc-phosphor-image

*Build Configuration:*
*BB_VERSION        = "1.32.0"*
*BUILD_SYS         = "x86_64-linux"*
*NATIVELSBSTRING   = "Ubuntu-16.04"*
*TARGET_SYS        = "arm-openbmc-linux-gnueabi"*
*MACHINE           = "raspberrypi"*
*DISTRO            = "openbmc-phosphor"*
*DISTRO_VERSION    = "0.1.0"*
*TUNE_FEATURES     = "arm armv6  vfp arm1176jzfs callconvention-hard"*
*TARGET_FPU        = "hard"*
*meta              *
*meta-poky         *
*meta-oe           *
*meta-networking   *
*meta-python       *
*meta-virtualization *
*meta-phosphor     *
*meta-raspberrypi  = "master:65edf7d796c34012982632d0a724d80ff44c9e4a"*


But the following error appears:

*ERROR: linux-raspberrypi-1_4.4.48+gitAUTOINC+7ddf96fbb7-r0
do_kernel_metadata: Function failed: do_kernel_metadata (log file is
located at
/home/tester/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276)*
*ERROR: Logfile of failure stored in:
/home/tester/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276*
*Log data follows:*
*| DEBUG: Executing shell function do_kernel_metadata*
*| ERROR. input file "phosphor-gpio-keys" does not exist*
*| ERROR: could not process input files:
/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig
/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rules.patch
phosphor-gpio-keys*
*|        See /tmp/tmp.GA2zgVbszZ for details*
*| ERROR. input file "phosphor-gpio-keys" does not exist*
*| ERROR: could not process input files:
/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig
/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rules.patch
phosphor-gpio-keys*
*|        See /tmp/tmp.BEzIPRvVMy for details*
*| WARNING: exit code 1 from a shell command.*
*| ERROR: Function failed: do_kernel_metadata (log file is located at
/home/tester/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276)*
*ERROR: Task
(/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata)
failed with exit code '1'*
*NOTE: Tasks Summary: Attempted 632 tasks of which 0 didn't need to be
rerun and 1 failed.*
*Summary: 1 task failed:*
*
/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata*
*Summary: There were 6 WARNING messages shown.*
*Summary: There was 1 ERROR message shown, returning a non-zero exit code.*

Is there something wrong with the steps I've tried ?

Regards,




*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-10-06 20:02 GMT-03:00 Javier Romero <xavinux@gmail.com>:

> Rick / Andrew,
>
> Thank you very much for your answer and suggestions.
>
> I'm looking at that repository on Github now.
>
> Regards,
>
>
>
>
> *Javier Romero*
>
> *E-mail: xavinux@gmail.com <xavinux@gmail.com>*
>
> *Skype: xavinux*
>
>
> 2017-10-06 18:28 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:
>
>>
>>
>> On Sat, 7 Oct 2017, at 03:29, Rick Altherr wrote:
>> > When you run  export TEMPLATECONF=meta-openbmc-machines/meta-
>> > openpower/meta-ibm/meta-palmetto/conf, you are telling the build system
>> > that you want to build images for the BMC processor used on the Palmetto
>> > machine (Aspeed AST2400).  That image won't boot on a RaspberryPi.  What
>> > you'll need to do is create a new layer in meta-openbmc-machines for a
>> > RaspberryPi that includes the raspberrypi layer, specifies the correct
>> > kernel device tree, etc.
>>
>>  As a heads-up, some of this work has already been done:
>>
>> https://github.com/openbmc/openbmc/tree/master/meta-openbmc-
>> machines/meta-evb/meta-evb-raspberrypi/conf
>>
>> It was added in this change:
>>
>> https://gerrit.openbmc-project.xyz/#/c/508/
>>
>> I don't think it was thoroughly tested and it has probably bit-rotted,
>> but maybe it's existence will flatten out the learning curve a bit.
>>
>> Cheers,
>>
>> Andrew
>>
>
>

--001a1147732ebd77e8055b01bd4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve tried these steps:<div><br></div><div><div><i sty=
le=3D"font-weight:bold">1. tester@obmc:~$ </i>cd openbmc</div><div><i><b><b=
r></b></i></div><div><b style=3D"font-style:italic">2. tester@obmc:/openbmc=
$ </b>export TEMPLATECONF=3Dmeta-openbmc-machines/meta-evb/meta-evb-raspber=
rypi/conf</div><div><i><b><br></b></i></div><div><i style=3D"font-weight:bo=
ld">3. tester@obmc:/openbmc$ </i>. oe-init-build-env ~/my-build-raspberrypi=
</div><div><i><b><br></b></i></div><div><i style=3D"font-weight:bold">4. te=
ster@obmc:~/my-build-raspberrypi$ </i>bitbake obmc-phosphor-image</div><div=
><i><b><br></b></i></div><div><i><b>Build Configuration:</b></i><br></div><=
div><i><b>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.32.0&quot;</b><=
/i></div><div><i><b>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-=
linux&quot;</b></i></div><div><i><b>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu=
-16.04&quot;</b></i></div><div><i><b>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;arm-openbmc-linux-gnueabi&quot;</b></i></div><div><i><b>MACHINE =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;raspberrypi&quot;</b></i></div=
><div><i><b>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;openb=
mc-phosphor&quot;</b></i></div><div><i><b>DISTRO_VERSION =C2=A0 =C2=A0=3D &=
quot;0.1.0&quot;</b></i></div><div><i><b>TUNE_FEATURES =C2=A0 =C2=A0 =3D &q=
uot;arm armv6 =C2=A0vfp arm1176jzfs callconvention-hard&quot;</b></i></div>=
<div><i><b>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hard&quot;</b></=
i></div><div><i><b>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</b=
></i></div><div><i><b>meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</b></i></=
div><div><i><b>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</b></i></di=
v><div><i><b>meta-networking =C2=A0=C2=A0</b></i></div><div><i><b>meta-pyth=
on =C2=A0 =C2=A0 =C2=A0=C2=A0</b></i></div><div><i><b>meta-virtualization=
=C2=A0</b></i></div><div><i><b>meta-phosphor =C2=A0 =C2=A0=C2=A0</b></i></d=
iv><div><i><b>meta-raspberrypi =C2=A0=3D &quot;master:65edf7d796c3401298263=
2d0a724d80ff44c9e4a&quot;</b></i></div></div><div><div><br></div></div><div=
><br></div><div>But the following error appears:</div><div><br></div><div><=
div><b><i><font color=3D"#ff0000">ERROR: linux-raspberrypi-1_4.4.48+gitAUTO=
INC+7ddf96fbb7-r0 do_kernel_metadata: Function failed: do_kernel_metadata (=
log file is located at /home/tester/my-build-raspberrypi/tmp/work/raspberry=
pi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r=
0/temp/log.do_kernel_metadata.7276)</font></i></b></div><div><b><i><font co=
lor=3D"#ff0000">ERROR: Logfile of failure stored in: /home/tester/my-build-=
raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_=
4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276</font></i>=
</b></div><div><b><i><font color=3D"#ff0000">Log data follows:</font></i></=
b></div><div><b><i><font color=3D"#ff0000">| DEBUG: Executing shell functio=
n do_kernel_metadata</font></i></b></div><div><b><i><font color=3D"#ff0000"=
>| ERROR. input file &quot;phosphor-gpio-keys&quot; does not exist</font></=
i></b></div><div><b><i><font color=3D"#ff0000">| ERROR: could not process i=
nput files: /home/tester/openbmc/import-layers/meta-raspberrypi/recipes-ker=
nel/linux/linux-raspberrypi/defconfig /home/tester/openbmc/import-layers/me=
ta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rul=
es.patch phosphor-gpio-keys</font></i></b></div><div><b><i><font color=3D"#=
ff0000">| =C2=A0 =C2=A0 =C2=A0 =C2=A0See /tmp/tmp.GA2zgVbszZ for details</f=
ont></i></b></div><div><b><i><font color=3D"#ff0000">| ERROR. input file &q=
uot;phosphor-gpio-keys&quot; does not exist</font></i></b></div><div><b><i>=
<font color=3D"#ff0000">| ERROR: could not process input files: /home/teste=
r/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspber=
rypi/defconfig /home/tester/openbmc/import-layers/meta-raspberrypi/recipes-=
kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rules.patch phosphor-gpio-=
keys</font></i></b></div><div><b><i><font color=3D"#ff0000">| =C2=A0 =C2=A0=
 =C2=A0 =C2=A0See /tmp/tmp.BEzIPRvVMy for details</font></i></b></div><div>=
<b><i><font color=3D"#ff0000">| WARNING: exit code 1 from a shell command.<=
/font></i></b></div><div><b><i><font color=3D"#ff0000">| ERROR: Function fa=
iled: do_kernel_metadata (log file is located at /home/tester/my-build-rasp=
berrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.=
48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276)</font></i></b=
></div><div><b><i><font color=3D"#ff0000">ERROR: Task (/home/tester/openbmc=
/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.4.=
bb:do_kernel_metadata) failed with exit code &#39;1&#39;</font></i></b></di=
v><div><b><i><font color=3D"#ff0000">NOTE: Tasks Summary: Attempted 632 tas=
ks of which 0 didn&#39;t need to be rerun and 1 failed.</font></i></b></div=
><div><b><i><font color=3D"#ff0000">Summary: 1 task failed:</font></i></b><=
br></div><div><b><i><font color=3D"#ff0000">=C2=A0 /home/tester/openbmc/imp=
ort-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.4.bb:d=
o_kernel_metadata</font></i></b></div><div><b><i><font color=3D"#ff0000">Su=
mmary: There were 6 WARNING messages shown.</font></i></b></div><div><b><i>=
<font color=3D"#ff0000">Summary: There was 1 ERROR message shown, returning=
 a non-zero exit code.</font></i></b></div><div><br></div></div><div>Is the=
re something wrong with the steps I&#39;ve tried ?</div><div><br></div><div=
>Regards,</div><div><br></div><div><br></div></div><div class=3D"gmail_extr=
a"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javi=
er Romero<br></b></i></div><div style=3D"text-align:left"><span style=3D"co=
lor:rgb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<span styl=
e=3D"color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,255)">=
<a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a=
></span><br></b></i></span></div><div style=3D"text-align:left"><i><b><span=
 style=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</spa=
n> <span style=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255=
)">xavinux</span><br></u></span></span></b></i></div><div style=3D"text-ali=
gn:left"><br></div> </div></div></div>
<br><div class=3D"gmail_quote">2017-10-06 20:02 GMT-03:00 Javier Romero <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">x=
avinux@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Rick / Andrew,<div><br></div><div>Thank you very much for your ans=
wer and suggestions.</div><div><br></div><div>I&#39;m looking at that repos=
itory on Github now.</div><div><br></div><div>Regards,</div><div><br></div>=
<div><br></div></div><div class=3D"gmail_extra"><span class=3D""><br clear=
=3D"all"><div><div class=3D"m_-6336017448971060710gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:left">=
<i><b>Javier Romero<br></b></i></div><div style=3D"text-align:left"><span s=
tyle=3D"color:rgb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:=
<span style=3D"color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(=
0,0,255)"><a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gm=
ail.com</a></span><br></b></i></span></div><div style=3D"text-align:left"><=
i><b><span style=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">S=
kype:</span> <span style=3D"color:rgb(11,83,148)"><u><span style=3D"color:r=
gb(0,0,255)">xavinux</span><br></u></span></span></b></i></div><div style=
=3D"text-align:left"><br></div> </div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">2017-10-06 18:=
28 GMT-03:00 Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew@=
aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br>
<br>
On Sat, 7 Oct 2017, at 03:29, Rick Altherr wrote:<br>
&gt; When you run=C2=A0 export TEMPLATECONF=3Dmeta-openbmc-mach<wbr>ines/me=
ta-<br>
<span>&gt; openpower/meta-ibm/meta-palmet<wbr>to/conf, you are telling the =
build system<br>
&gt; that you want to build images for the BMC processor used on the Palmet=
to<br>
&gt; machine (Aspeed AST2400).=C2=A0 That image won&#39;t boot on a Raspber=
ryPi.=C2=A0 What<br>
&gt; you&#39;ll need to do is create a new layer in meta-openbmc-machines f=
or a<br>
&gt; RaspberryPi that includes the raspberrypi layer, specifies the correct=
<br>
&gt; kernel device tree, etc.<br>
<br>
</span>=C2=A0As a heads-up, some of this work has already been done:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-openbmc-mach=
ines/meta-evb/meta-evb-raspberrypi/conf" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/openbmc/ope<wbr>nbmc/tree/master/meta-openbmc-<wbr>ma=
chines/meta-evb/meta-evb-<wbr>raspberrypi/conf</a><br>
<br>
It was added in this change:<br>
<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/508/" rel=3D"noreferrer" =
target=3D"_blank">https://gerrit.openbmc-project<wbr>.xyz/#/c/508/</a><br>
<br>
I don&#39;t think it was thoroughly tested and it has probably bit-rotted,<=
br>
but maybe it&#39;s existence will flatten out the learning curve a bit.<br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a1147732ebd77e8055b01bd4c--
