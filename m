Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4Cfz5ZR"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wBKD5DdZzDr43
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 21:27:28 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id bi12-v6so8772115plb.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Y8HMSNlc6CybZEVDyS8J969z8c6LiD5Wni6Xsj6Ygsc=;
 b=T4Cfz5ZRmWsLQgltyAQMIH+eazj/Gh4WJB+h5GBQ3+JpaCk//9xkJE9OWCzECUA0rR
 viuOGKPUURwmdWLTvdk59D4ujhQY8HwhtQe38RmVuBzDFaLHJjFtM/QR914zHK2rIt/8
 wrpmv9ZK6aXqKzwz0NMHtivrUpFVpIEuj5VV//Cd6+t4lIWYRYjYDHBjBhdsu4uf9hRM
 RMdCJOa+HRr3aTARw87bwHjBW/RZrj1jw7vZnsHYdDvWc3OcS9yLfTtFzeedoFdIL7Ra
 udkaj2YoxTzadk0dhPLD3JVVvWcAMg3liIBw2ju0mAjQW/QE13FJRv29JZchLUjUS20j
 XXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Y8HMSNlc6CybZEVDyS8J969z8c6LiD5Wni6Xsj6Ygsc=;
 b=UGQIknNoAYv2ueAgfQgFxikt0gZ/Sb8fJwui/9FPVKy2dhHegb2/HwXhzyc+ZmOsTM
 8X/tGGuDnjI+DTYz/vbQ3euo0nv7YTn7hTBPPhQlOhJM578QofN02Vo8BfmaU174o59+
 Pn3kYtuRru6OM6NUIiYM8v4eG/QiJp9IOeJZpZ/wSLAEq3UfuZ1NXgzJ6Cb3nxDwuiCS
 /mnFcxtmneZD0Go1zPhG6gsd1UzB7lzc6F5Qlw1Sanq8ucchpKIZVM+f0UWzX04JFWLI
 YEGi9R/hzALg4Oqxpu1q1XG7kf65hJye5ACNdEl9Jn3oNfU7SY+/4V4uloxPJ4OFSkBn
 FztA==
X-Gm-Message-State: ALKqPwcAGi/bhV0SYN5EQC7ZuxAuFFYaH5VBc1HEHYC2Bjyutxc6kasR
 x3tx4S/KG9dayDww+sdmRe8=
X-Google-Smtp-Source: ADUXVKL/xdEg51n/7bYVL4hp8mcrPQOlMPt1RoLtqwK0jAKE4QabvNa+RelaN1MIBKYx5FgaO66V/g==
X-Received: by 2002:a17:902:ba87:: with SMTP id
 k7-v6mr11953858pls.271.1527593246493; 
 Tue, 29 May 2018 04:27:26 -0700 (PDT)
Received: from [192.168.1.2] (220-128-238-123.HINET-IP.hinet.net.
 [220.128.238.123])
 by smtp.gmail.com with ESMTPSA id w19-v6sm41105358pgv.59.2018.05.29.04.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 May 2018 04:27:25 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Message-Id: <3A58F91A-3DB3-4C38-A22E-19D739807B0F@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_63930555-0095-4AF5-A492-812E317829F9"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: Re: Fail to start org.openbmc.managers.System.service
Date: Tue, 29 May 2018 19:27:22 +0800
In-Reply-To: <OF3B2252E3.FE6C041B-ON0025829B.00434D62-6525829B.0043BF4E@notes.na.collabserv.com>
Cc: openbmc@lists.ozlabs.org
To: George Keishing <gkeishin@in.ibm.com>
References: <6A9E4639-55AA-4DE5-B62B-92056DBB2AAD@gmail.com>
 <OF3B2252E3.FE6C041B-ON0025829B.00434D62-6525829B.0043BF4E@notes.na.collabserv.com>
X-Mailer: Apple Mail (2.3445.6.18)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 11:27:29 -0000


--Apple-Mail=_63930555-0095-4AF5-A492-812E317829F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi George,
I have tried your suggestion, but the problem doesn=E2=80=99t fix.
And just noticed a commit here:
=
https://github.com/openbmc/skeleton/commit/f6e918e4e05e94d0eaafa97c6c31d47=
ae5b1bf49#diff-b07a6297d344f5bbff9249965d0e8e3c =
<https://github.com/openbmc/skeleton/commit/f6e918e4e05e94d0eaafa97c6c31d4=
7ae5b1bf49#diff-b07a6297d344f5bbff9249965d0e8e3c>
=
https://gerrit.openbmc-project.xyz/#/c/9737/3/pysystemmgr/system_manager.p=
y =
<https://gerrit.openbmc-project.xyz/#/c/9737/3/pysystemmgr/system_manager.=
py>

Looks like the obmc.inventory can be removed, but has some other =
problems on Witherspoon.
After removed this commit, the org.openbmc.managers.System.service start =
working good.
But I am not sure if this is  a correct way to fix it.

Thanks.

> On May 28, 2018, at 20:19, George Keishing <gkeishin@in.ibm.com> =
wrote:
>=20
> Brad,
>=20
> Not sure if this would help. Probably previous build left over, try =
this
>=20
> Login to BMC =20
>=20
> cd /var/lib/
>=20
> root@witherspoon:/var/lib# ls
> dropbear                    obmc                        =
phosphor-inventory-manager  phosphor-settings-manager   =
phosphor-state-manager
> machines                    phosphor-debug-collector    =
phosphor-logging            phosphor-software-manager   systemd
> root@witherspoon:/var/lib#
>=20
> root@witherspoon:/var/lib# rm -rf phosphor-inventory-manager =
phosphor-settings-manager phosphor-state-manager
>=20
> Reboot BMC=20
>=20
>=20
> Thanks and Regards,
>    George Keishing
>    IBM Systems &Technology Lab, Firmware Development,
> =E2=80=9CThere isn't enough time in a day to be lazy!!! .=E2=80=9D
> <Mail Attachment.jpeg>
>=20
>=20
>=20
>=20
> From:        Brad Chou <chou.brad@gmail.com>
> To:        openbmc@lists.ozlabs.org
> Date:        05/28/2018 03:34 PM
> Subject:        Fail to start org.openbmc.managers.System.service
> Sent by:        "openbmc" =
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>
>=20
>=20
>=20
> Hi all,
> I have s problem while start the org.openbmc.managers.System.service
> The log says it fail to import obmc.inventory
> Then every other service that required =
org.openbmc.managers.System.service just forced to be stoped.
> Can anyone tell me what the obmc.inventory is ?
> How can I fix this problem ?
> Thanks.
>=20
> May 25 11:20:58 system_manager.py[1015]: Traceback (most recent call =
last):
> May 25 11:20:58 system_manager.py[1015]:   File =
"/usr/sbin/system_manager.py", line 15, in <module>
> May 25 11:20:58 system_manager.py[1015]:     import obmc.inventory
> May 25 11:20:58 system_manager.py[1015]: ImportError: No module named =
inventory
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Main =
process exited, code=3Dexited, status=3D1/FAILURE
> May 25 11:20:59 systemd[1]: Failed to start Phoshpor System Manager.
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Unit =
entered failed state.
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: =
Failed with result 'exit-code'.
>=20
>=20
>=20


--Apple-Mail=_63930555-0095-4AF5-A492-812E317829F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
George,<div class=3D"">I have tried your suggestion, but the problem =
doesn=E2=80=99t fix.</div><div class=3D"">And just noticed a commit =
here:</div><div class=3D""><a =
href=3D"https://github.com/openbmc/skeleton/commit/f6e918e4e05e94d0eaafa97=
c6c31d47ae5b1bf49#diff-b07a6297d344f5bbff9249965d0e8e3c" =
class=3D"">https://github.com/openbmc/skeleton/commit/f6e918e4e05e94d0eaaf=
a97c6c31d47ae5b1bf49#diff-b07a6297d344f5bbff9249965d0e8e3c</a></div><div =
class=3D""><a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/9737/3/pysystemmgr/system_m=
anager.py" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/9737/3/pysystemmgr/syste=
m_manager.py</a></div><div class=3D""><br class=3D""></div><div =
class=3D"">Looks like the obmc.inventory can be removed, but has some =
other problems on Witherspoon.</div><div class=3D"">After removed this =
commit, the&nbsp;org.openbmc.managers.System.service start working =
good.</div><div class=3D"">But I am not sure if this is &nbsp;a correct =
way to fix it.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks.<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On May 28, 2018, at 20:19, =
George Keishing &lt;<a href=3D"mailto:gkeishin@in.ibm.com" =
class=3D"">gkeishin@in.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" class=3D"">Brad,</span><br =
class=3D""><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" class=3D"">Not sure if this
would help. Probably previous build left over, try this</span><br =
class=3D""><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" class=3D"">Login to BMC =
&nbsp;</span><br class=3D""><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" class=3D"">cd /var/lib/</span><br =
class=3D""><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" =
class=3D"">root@witherspoon:/var/lib#
ls</span><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" class=3D"">dropbear &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obmc =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;phosphor-inventory-manager
&nbsp;phosphor-settings-manager &nbsp; phosphor-state-manager</span><br =
class=3D""><span style=3D" font-size:10pt;font-family:sans-serif" =
class=3D"">machines &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;phosphor-debug-collector
&nbsp; &nbsp;phosphor-logging &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;phosphor-software-manager
&nbsp; systemd</span><br class=3D""><span style=3D" =
font-size:10pt;font-family:sans-serif" =
class=3D"">root@witherspoon:/var/lib#</span><br class=3D""><br =
class=3D""><span style=3D" font-size:10pt;font-family:sans-serif" =
class=3D"">root@witherspoon:/var/lib#
rm -rf phosphor-inventory-manager phosphor-settings-manager =
phosphor-state-manager</span><br class=3D""><br class=3D""><span style=3D"=
 font-size:10pt;font-family:sans-serif" class=3D"">Reboot BMC </span><br =
class=3D""><br class=3D""><br class=3D""><span style=3D" =
font-size:10pt;color:blue;font-family:sans-serif" class=3D""><b =
class=3D"">Thanks
and Regards,</b></span><br class=3D""><span style=3D" =
font-size:10pt;color:blue;font-family:sans-serif" class=3D"">&nbsp;
&nbsp;George Keishing</span><br class=3D""><span style=3D" =
font-size:10pt;color:blue;font-family:sans-serif" class=3D"">&nbsp;
&nbsp;IBM Systems &amp;Technology Lab, Firmware Development,</span><br =
class=3D""><span style=3D" font-size:10pt;font-family:sans-serif" =
class=3D""><i class=3D"">=E2=80=9C</i></span><span style=3D" =
font-size:12pt" class=3D"">There isn't enough time in a day to be =
lazy!!! </span><span style=3D" font-size:9pt;font-family:sans-serif" =
class=3D"">.=E2=80=9D</span><br class=3D""><span =
id=3D"cid:_2_0AF7F53C0AF7F2D00043788C6525829B">&lt;Mail =
Attachment.jpeg&gt;</span><br class=3D""><br class=3D""><br class=3D""><br=
 class=3D""><br class=3D""><span style=3D" =
font-size:9pt;color:#5f5f5f;font-family:sans-serif" class=3D"">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" =
font-size:9pt;font-family:sans-serif" class=3D"">Brad
Chou &lt;<a href=3D"mailto:chou.brad@gmail.com" =
class=3D"">chou.brad@gmail.com</a>&gt;</span><br class=3D""><span =
style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif" =
class=3D"">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" =
font-size:9pt;font-family:sans-serif" class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a></span><br class=3D""><span =
style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif" =
class=3D"">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" =
font-size:9pt;font-family:sans-serif" class=3D"">05/28/2018
03:34 PM</span><br class=3D""><span style=3D" =
font-size:9pt;color:#5f5f5f;font-family:sans-serif" class=3D"">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" =
font-size:9pt;font-family:sans-serif" class=3D"">Fail
to start org.openbmc.managers.System.service</span><br class=3D""><span =
style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif" =
class=3D"">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" =
font-size:9pt;font-family:sans-serif" class=3D"">"openbmc"
&lt;<a =
href=3D"mailto:openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org" =
class=3D"">openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org</a>&gt;<=
/span><br class=3D""><hr noshade=3D"" class=3D""><br class=3D""><br =
class=3D""><br class=3D""><tt class=3D""><span style=3D" font-size:10pt" =
class=3D"">Hi all,<br class=3D"">I have s problem while start the =
org.openbmc.managers.System.service<br class=3D"">The log says it fail =
to import obmc.inventory<br class=3D"">Then every other service that =
required org.openbmc.managers.System.service
just forced to be stoped.<br class=3D"">Can anyone tell me what the =
obmc.inventory is ?<br class=3D"">How can I fix this problem ?<br =
class=3D"">Thanks.<br class=3D""><br class=3D"">May 25 11:20:58 =
system_manager.py[1015]: Traceback (most recent call last):<br =
class=3D"">May 25 11:20:58 system_manager.py[1015]: &nbsp; File =
"/usr/sbin/system_manager.py",
line 15, in &lt;module&gt;<br class=3D"">May 25 11:20:58 =
system_manager.py[1015]: &nbsp; &nbsp; import obmc.inventory<br =
class=3D"">May 25 11:20:58 system_manager.py[1015]: ImportError: No =
module named inventory<br class=3D"">May 25 11:20:59 systemd[1]: =
org.openbmc.managers.System.service: Main process
exited, code=3Dexited, status=3D1/FAILURE<br class=3D"">May 25 11:20:59 =
systemd[1]: Failed to start Phoshpor System Manager.<br class=3D"">May =
25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Unit =
entered
failed state.<br class=3D"">May 25 11:20:59 systemd[1]: =
org.openbmc.managers.System.service: Failed
with result 'exit-code'.<br class=3D""></span></tt><br class=3D""><br =
class=3D""><br class=3D"">
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_63930555-0095-4AF5-A492-812E317829F9--
