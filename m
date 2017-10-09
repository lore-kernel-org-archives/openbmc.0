Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::230; helo=mail-qk0-x230.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9VMU7wX"; 
 dkim-atps=neutral
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9Q0T47nDzDqv8
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 13:58:00 +1100 (AEDT)
Received: by mail-qk0-x230.google.com with SMTP id f199so9248157qke.2
 for <openbmc@lists.ozlabs.org>; Sun, 08 Oct 2017 19:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=57VpyoGe2UIDLWsq39qRA4J4U/1adHwVYmRuSqNPseI=;
 b=f9VMU7wXb0QOXHezCEQcxR6fntjW//odIDceXXk+x+2UEAIWhtbBcEapc9xOuzI3yH
 IuqPXjPpVKyEf0UcyD6qvbVrO/QQ5tSty9kPYjQ5YhacJnS7MpWOBh0JXPFZ26ymNBB0
 /7qHvp8qVfi5aCwITiMEmnM6NvMlIu1028YQjX1CEl+Fc4jvCDqhVf9lRILWR+oDFcxy
 rIEQTs5Tqn+kHcDWFSem5Bgu6riUyPuU9EpIQIP+E36ltgi8i8xdObmQ9Y1qH6OCDMnO
 yKRJvqx/bLYRrN0V1Opvk21+8ZxFnV0o3VS0Fyh1/2+GS1D1BW+L352/Snbt03oen6c+
 vPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=57VpyoGe2UIDLWsq39qRA4J4U/1adHwVYmRuSqNPseI=;
 b=jyAM7zLH/wSwBuLAv75sKqz8WK3y5eB9qap1l6vN6yHryQOX1jTSolwDP0CkaYLhV2
 fDFqczl2XnFSoPC64wXeZ11xtg5pHnUQOQa/fc5B/rleuyZjjdg1M0e1Z2oDzsq2a/HY
 ILRruCtCwEj1Uu2vzQBWRfNvszDy745p9198X/WnAXkjmqKOyRWjeanu/nuDm19FwDAk
 EYc1ay+YnQYPurdk2gVS+JCZIxYukpsmcjvLpkvSB1xLGazM0aUariNzlUaEYgzfnTR1
 XtKong897VJ3j+u3YotunzteY0LQ1900Gdx/qlh2rkPfZ+KWMZ1dQ5+BZkJHLTUg6Tx9
 jKAA==
X-Gm-Message-State: AMCzsaVXLXVok/OazhYPCj8IRi7EHfb+NCs5vSrS+PBXAXQVWVAHVH1k
 /5YfMgUqWUs0sJ0NICgXyPk/5TMmjvzKJJbaeMY=
X-Google-Smtp-Source: AOwi7QAFDhF72o2Afx4rWYw9FHRtXNoD9+HI6airjxWxN+RLGlaPW59u69/1dWUJDEX3KbWILCrR/6APEhzZbbn5cys=
X-Received: by 10.233.221.133 with SMTP id r127mr1791698qkf.205.1507517877363; 
 Sun, 08 Oct 2017 19:57:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Sun, 8 Oct 2017 19:57:56 -0700 (PDT)
In-Reply-To: <1507466681.5452.143.camel@aj.id.au>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
From: Javier Romero <xavinux@gmail.com>
Date: Sun, 8 Oct 2017 23:57:56 -0300
Message-ID: <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c0441ba92a761055b145b6d"
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
X-List-Received-Date: Mon, 09 Oct 2017 02:58:02 -0000

--94eb2c0441ba92a761055b145b6d
Content-Type: text/plain; charset="UTF-8"

Andrew,

Thans for your answer.

Bug reported: https://github.com/openbmc/openbmc/issues/2434

I`d like to try to cook up a patch, but do I need to know a specific
language programming to do this ?

Regards,











*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-10-08 9:44 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:

> On Sun, 2017-10-08 at 01:45 -0300, Javier Romero wrote:
> > I've tried these steps:
> >
> > 1. tester@obmc:~$ cd openbmc
> >
> > 2. tester@obmc:/openbmc$ export TEMPLATECONF=meta-openbmc-
> machines/meta-evb/meta-evb-raspberrypi/conf
> >
> > 3. tester@obmc:/openbmc$ . oe-init-build-env ~/my-build-raspberrypi
> >
> > 4. tester@obmc:~/my-build-raspberrypi$ bitbake obmc-phosphor-image
> >
> > Build Configuration:
> > BB_VERSION        = "1.32.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-16.04"
> > TARGET_SYS        = "arm-openbmc-linux-gnueabi"
> > MACHINE           = "raspberrypi"
> > DISTRO            = "openbmc-phosphor"
> > DISTRO_VERSION    = "0.1.0"
> > TUNE_FEATURES     = "arm armv6  vfp arm1176jzfs callconvention-hard"
> > TARGET_FPU        = "hard"
> > meta
> > meta-poky
> > meta-oe
> > meta-networking
> > meta-python
> > meta-virtualization
> > meta-phosphor
> > meta-raspberrypi  = "master:65edf7d796c34012982632d0a724d80ff44c9e4a"
> >
> >
> > But the following error appears:
> >
> > ERROR: linux-raspberrypi-1_4.4.48+gitAUTOINC+7ddf96fbb7-r0
> do_kernel_metadata: Function failed: do_kernel_metadata (log file is
> located at /home/tester/my-build-raspberrypi/tmp/work/
> raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.
> 4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276)
> > ERROR: Logfile of failure stored in: /home/tester/my-build-
> raspberrypi/tmp/work/raspberrypi-openbmc-linux-
> gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/
> temp/log.do_kernel_metadata.7276
> > Log data follows:
> > | DEBUG: Executing shell function do_kernel_metadata
> > | ERROR. input file "phosphor-gpio-keys" does not exist
> > | ERROR: could not process input files: /home/tester/openbmc/import-
> layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig
> /home/tester/openbmc/import-layers/meta-raspberrypi/
> recipes-kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rules.patch
> phosphor-gpio-keys
> > |        See /tmp/tmp.GA2zgVbszZ for details
> > | ERROR. input file "phosphor-gpio-keys" does not exist
> > | ERROR: could not process input files: /home/tester/openbmc/import-
> layers/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig
> /home/tester/openbmc/import-layers/meta-raspberrypi/
> recipes-kernel/linux/linux-raspberrypi-4.4/0001-fix-dtbo-rules.patch
> phosphor-gpio-keys
> > |        See /tmp/tmp.BEzIPRvVMy for details
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_kernel_metadata (log file is located at
> /home/tester/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-
> gnueabi/linux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/
> temp/log.do_kernel_metadata.7276)
> > ERROR: Task (/home/tester/openbmc/import-layers/meta-raspberrypi/
> recipes-kernel/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata) failed
> with exit code '1'
> > NOTE: Tasks Summary: Attempted 632 tasks of which 0 didn't need to be
> rerun and 1 failed.
> > Summary: 1 task failed:
> >   /home/tester/openbmc/import-layers/meta-raspberrypi/
> recipes-kernel/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata
> > Summary: There were 6 WARNING messages shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> >
> > Is there something wrong with the steps I've tried ?
>
> Nope, that's just an outright bug in the raspi support. I'd recommend
> several
> things here:
>
> 1. Open an issue in the github issue tracker[0]
> 2. Cook up a patch! It looks like this might have to do with assumptions
> made
>    in meta-phosphor/conf/distro/openbmc-phosphor.conf, as the raspi uses a
>    different kernel tree to the ASPEED SoCs
> 3. For better or worse patches are submitted via Gerrit[1], so push your
> patch
>    there
>
> Make sure to speak up here or on IRC if you get stuck :)
>
> Andrew
>
> [0] https://github.com/openbmc/openbmc/issues
> [1] https://gerrit.openbmc-project.xyz/#/q/status:open

--94eb2c0441ba92a761055b145b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Andrew,<div><br></div><div>Thans for your answer.</div><di=
v><br></div><div>Bug reported:=C2=A0<a href=3D"https://github.com/openbmc/o=
penbmc/issues/2434">https://github.com/openbmc/openbmc/issues/2434</a></div=
><div><br></div><div>I`d like to try to cook up a patch, but do I need to k=
now a specific language programming to do this ?</div><div><br></div><div>R=
egards,</div><div><br></div><div><br></div><div><br></div><div><br></div><d=
iv><br></div><div><br></div><div><br></div><div><br></div><div><br></div></=
div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div style=3D=
"text-align:left"><i><b>Javier Romero<br></b></i></div><div style=3D"text-a=
lign:left"><span style=3D"color:rgb(19,79,92)"><i><b><span style=3D"color:r=
gb(0,0,0)">E-mail:<span style=3D"color:rgb(0,0,255)"> </span></span><span s=
tyle=3D"color:rgb(0,0,255)"><a href=3D"mailto:xavinux@gmail.com" target=3D"=
_blank">xavinux@gmail.com</a></span><br></b></i></span></div><div style=3D"=
text-align:left"><i><b><span style=3D"color:rgb(19,79,92)"><span style=3D"c=
olor:rgb(0,0,0)">Skype:</span> <span style=3D"color:rgb(11,83,148)"><u><spa=
n style=3D"color:rgb(0,0,255)">xavinux</span><br></u></span></span></b></i>=
</div><div style=3D"text-align:left"><br></div> </div></div></div>
<br><div class=3D"gmail_quote">2017-10-08 9:44 GMT-03:00 Andrew Jeffery <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">and=
rew@aj.id.au</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">On Sun, 2017-10-08 at 01:45 -0300, Javier Rom=
ero wrote:<br>
&gt; I&#39;ve tried these steps:<br>
&gt;=C2=A0<br>
&gt; 1. tester@obmc:~$ cd openbmc<br>
&gt;=C2=A0<br>
&gt; 2. tester@obmc:/openbmc$ export TEMPLATECONF=3Dmeta-openbmc-<wbr>machi=
nes/meta-evb/meta-evb-<wbr>raspberrypi/conf<br>
&gt;=C2=A0<br>
&gt; 3. tester@obmc:/openbmc$ . oe-init-build-env ~/my-build-raspberrypi<br=
>
&gt;=C2=A0<br>
&gt; 4. tester@obmc:~/my-build-<wbr>raspberrypi$ bitbake obmc-phosphor-imag=
e<br>
&gt;=C2=A0<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.32.0&quot;<br>
&gt; BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-16.04&quot;<br>
&gt; TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-openbmc-linux-gnue=
abi&quot;<br>
&gt; MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;raspberrypi&quot;=
<br>
&gt; DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;openbmc-phos=
phor&quot;<br>
&gt; DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;0.1.0&quot;<br>
&gt; TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv6 =C2=A0vfp arm1176jzfs =
callconvention-hard&quot;<br>
&gt; TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hard&quot;<br>
&gt; meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt; meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt; meta-networking =C2=A0=C2=A0<br>
&gt; meta-python =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt; meta-virtualization=C2=A0<br>
&gt; meta-phosphor =C2=A0 =C2=A0=C2=A0<br>
&gt; meta-raspberrypi =C2=A0=3D &quot;master:<wbr>65edf7d796c34012982632d0a=
724d8<wbr>0ff44c9e4a&quot;<br>
&gt;=C2=A0<br>
&gt;=C2=A0<br>
&gt; But the following error appears:<br>
&gt;=C2=A0<br>
&gt; ERROR: linux-raspberrypi-1_4.4.48+<wbr>gitAUTOINC+7ddf96fbb7-r0 do_ker=
nel_metadata: Function failed: do_kernel_metadata (log file is located at /=
home/tester/my-build-<wbr>raspberrypi/tmp/work/<wbr>raspberrypi-openbmc-lin=
ux-<wbr>gnueabi/linux-raspberrypi/1_4.<wbr>4.48+gitAUTOINC+7ddf96fbb7-r0/<w=
br>temp/log.do_kernel_metadata.<wbr>7276)<br>
&gt; ERROR: Logfile of failure stored in: /home/tester/my-build-<wbr>raspbe=
rrypi/tmp/work/<wbr>raspberrypi-openbmc-linux-<wbr>gnueabi/linux-raspberryp=
i/1_4.<wbr>4.48+gitAUTOINC+7ddf96fbb7-r0/<wbr>temp/log.do_kernel_metadata.<=
wbr>7276<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_kernel_metadata<br>
&gt; | ERROR. input file &quot;phosphor-gpio-keys&quot; does not exist<br>
&gt; | ERROR: could not process input files: /home/tester/openbmc/import-<w=
br>layers/meta-raspberrypi/<wbr>recipes-kernel/linux/linux-<wbr>raspberrypi=
/defconfig /home/tester/openbmc/import-<wbr>layers/meta-raspberrypi/<wbr>re=
cipes-kernel/linux/linux-<wbr>raspberrypi-4.4/0001-fix-dtbo-<wbr>rules.patc=
h phosphor-gpio-keys<br>
&gt; | =C2=A0 =C2=A0 =C2=A0 =C2=A0See /tmp/tmp.GA2zgVbszZ for details<br>
&gt; | ERROR. input file &quot;phosphor-gpio-keys&quot; does not exist<br>
&gt; | ERROR: could not process input files: /home/tester/openbmc/import-<w=
br>layers/meta-raspberrypi/<wbr>recipes-kernel/linux/linux-<wbr>raspberrypi=
/defconfig /home/tester/openbmc/import-<wbr>layers/meta-raspberrypi/<wbr>re=
cipes-kernel/linux/linux-<wbr>raspberrypi-4.4/0001-fix-dtbo-<wbr>rules.patc=
h phosphor-gpio-keys<br>
&gt; | =C2=A0 =C2=A0 =C2=A0 =C2=A0See /tmp/tmp.BEzIPRvVMy for details<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Function failed: do_kernel_metadata (log file is located at /=
home/tester/my-build-<wbr>raspberrypi/tmp/work/<wbr>raspberrypi-openbmc-lin=
ux-<wbr>gnueabi/linux-raspberrypi/1_4.<wbr>4.48+gitAUTOINC+7ddf96fbb7-r0/<w=
br>temp/log.do_kernel_metadata.<wbr>7276)<br>
&gt; ERROR: Task (/home/tester/openbmc/import-<wbr>layers/meta-raspberrypi/=
<wbr>recipes-kernel/linux/linux-<wbr>raspberrypi_4.4.bb:do_kernel_<wbr>meta=
data) failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 632 tasks of which 0 didn&#39;t need to=
 be rerun and 1 failed.<br>
&gt; Summary: 1 task failed:<br>
&gt; =C2=A0 /home/tester/openbmc/import-<wbr>layers/meta-raspberrypi/<wbr>r=
ecipes-kernel/linux/linux-<wbr>raspberrypi_4.4.bb:do_kernel_<wbr>metadata<b=
r>
&gt; Summary: There were 6 WARNING messages shown.<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
&gt;=C2=A0<br>
&gt; Is there something wrong with the steps I&#39;ve tried ?<br>
<br>
</div></div>Nope, that&#39;s just an outright bug in the raspi support. I&#=
39;d recommend several<br>
things here:<br>
<br>
1. Open an issue in the github issue tracker[0]<br>
2. Cook up a patch! It looks like this might have to do with assumptions ma=
de<br>
=C2=A0=C2=A0=C2=A0in meta-phosphor/conf/distro/<wbr>openbmc-phosphor.conf, =
as the raspi uses a<br>
=C2=A0=C2=A0=C2=A0different kernel tree to the ASPEED SoCs<br>
3. For better or worse patches are submitted via Gerrit[1], so push your pa=
tch<br>
=C2=A0=C2=A0=C2=A0there<br>
<br>
Make sure to speak up here or on IRC if you get stuck :)<br>
<br>
Andrew<br>
<br>
[0] <a href=3D"https://github.com/openbmc/openbmc/issues" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/issues</a><br>
[1] <a href=3D"https://gerrit.openbmc-project.xyz/#/q/status:open" rel=3D"n=
oreferrer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/q/st=
atus:open</a></blockquote></div><br></div>

--94eb2c0441ba92a761055b145b6d--
