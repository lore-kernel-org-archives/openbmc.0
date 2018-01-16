Return-Path: <yutaoc1984@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c09::232; helo=mail-yb0-x232.google.com;
 envelope-from=yutaoc1984@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lr/l9M2u"; 
 dkim-atps=neutral
Received: from mail-yb0-x232.google.com (mail-yb0-x232.google.com
 [IPv6:2607:f8b0:4002:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLMrf1QQYzF0X5
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 18:52:33 +1100 (AEDT)
Received: by mail-yb0-x232.google.com with SMTP id i12so5355753ybj.7
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 23:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TJTnzib1NkzvY/U5zT2hBpgKNF+WiQNGJsS/wZVTKRg=;
 b=Lr/l9M2u7Vr0W3wxOh5Fdl2/+WeFBis1yk9BI0xEZmsTo+6cC+ICJvABHdOc6p9Rrb
 IaFaEu3xYuCsb1iTMM7EZOumfDDrQe1ictXxC0WwQnGHf0l2UtpsGBEMZpzilbTmVpQS
 iayma9zlD2iffN0QMzh17huaEXEK13sJUWiJVIy2XqRsLl/2HVCKPZiewWgreZReNFKz
 bJ4Sv3aIVXB/wFTHXpUW9pJxz7C3+Q1cppqTKv71QbRezqfFgFtgHcj589/3q767vwj5
 i9fv9o/cMNOMM6/CY5DxFx9unD+q2aHE3zqXeSm+a3FuycJmon71IKHai+y8Ds+s70o4
 E2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TJTnzib1NkzvY/U5zT2hBpgKNF+WiQNGJsS/wZVTKRg=;
 b=PMWHXT0/n/ulhiebkeHdC/5YlB+bSJHZ7u3HetXP99kCHVtpef43UXH4GBOh0OyTmI
 GlBnEI5ur/FtlC7u1drE0LY7XL5aqIIbF4a/CXojmDa1+Ogzfu7Wmyb2xNi8JdmsAF1g
 452EuHOEHDTaa3qLIMI2kZEhdSknvr47CibyBUgSpzVg41i/AbynZgYOHKMZnh1fYj8g
 QyR4yQ+lSXATzErZ6zF7kiPuMCA4N23nWBXSBnz2LL1telqUmfdRz3aJ9BmeDw2bbjHL
 DuV1cnM/7KmuyhqJCdTjwfGM2KBeOECRwzHoS488+FzHT/mq1fybs9RonNs3PXNN4YOl
 eMiw==
X-Gm-Message-State: AKwxytc4txBzhWAbtlmD0N5L/kMn5GcisxohAagY/Of3XWcu/HmZt4Jv
 IlOwmG2zNSziEMKSmNgb8J7FPH0pZgP0Ci9NkEASiw==
X-Google-Smtp-Source: ACJfBovFJr2xwCPPcFiFuTqYY77GnM7ftICGc+wYIZuS6wPOiGvOcFxu4+IGahjAVLh5lU+ZN9mX6/zp6Xry8cDTZwM=
X-Received: by 10.37.208.68 with SMTP id h65mr18472708ybg.494.1516089151139;
 Mon, 15 Jan 2018 23:52:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.95.65 with HTTP; Mon, 15 Jan 2018 23:52:30 -0800 (PST)
From: tao-ching Yu <yutaoc1984@gmail.com>
Date: Tue, 16 Jan 2018 15:52:30 +0800
Message-ID: <CAJRJBYN4DNOb8toOzJBXnTAUFm92t06+pKr7+VcxVKq_LvycqQ@mail.gmail.com>
Subject: [Phosphor-logging] Is there any method to avoid same event to record
 Constantly.
To: openbmc@lists.ozlabs.org
Cc: anoo@us.ibm.com, shyulei@cn.ibm.com
Content-Type: multipart/alternative; boundary="94eb2c05636c4d3a150562e003b5"
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
X-List-Received-Date: Tue, 16 Jan 2018 07:52:35 -0000

--94eb2c05636c4d3a150562e003b5
Content-Type: text/plain; charset="UTF-8"

HI all,

I have implemented the critical high event for sensors that referred by
example.yaml from phosphor-dbus-monitor. For example as below. When ambient
temperature over the critical threshold would log a critical event.
name: check ambient_mb temp
description: >
'If this condition passes at least one temp is running
too hot. log an event.'
class: condition
condition: count
paths: core sensors
properties: core temp
defer: 20000000us
callback: log the critical high event
countop: '>='
countbound: 1
op: '>='
bound: 31000
I have noticed that the "defer" which was an interval of the same
condition, but if the sensors keep over the critical high then the event
would be log every 20s and make the logging full(Maximum log number is 200).
So, is there any method to avoid it?Like event assert/de-assert that
defined by IPMI sel log specific?

--94eb2c05636c4d3a150562e003b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI all,<div><br></div><div>I have implemented the critical=
 high event for sensors that referred by example.yaml=C2=A0from phosphor-db=
us-monitor. For example as below. When ambient temperature over the critica=
l threshold would log a critical event.</div><div><span class=3D"gmail-pl-e=
nt" style=3D"box-sizing:border-box;color:rgb(34,134,58);font-family:SFMono-=
Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-s=
ize:12px;white-space:pre">name</span><span style=3D"color:rgb(36,41,46);fon=
t-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,=
monospace;font-size:12px;white-space:pre">: </span><span class=3D"gmail-pl-=
s" style=3D"box-sizing:border-box;color:rgb(3,47,98);font-family:SFMono-Reg=
ular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size=
:12px;white-space:pre">check ambient_mb temp=C2=A0</span><br></div><div><sp=
an class=3D"gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98);f=
ont-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courie=
r,monospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl-ent" st=
yle=3D"box-sizing:border-box;color:rgb(34,134,58)">description</span><span =
style=3D"color:rgb(36,41,46)">: </span><span class=3D"gmail-pl-s" style=3D"=
box-sizing:border-box">&gt;</span><br></span></div><div><span class=3D"gmai=
l-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98);font-family:SFMon=
o-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font=
-size:12px;white-space:pre">&#39;If this condition passes at least one temp=
 is running<br></span></div><div><span class=3D"gmail-pl-s" style=3D"box-si=
zing:border-box;color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,&quo=
t;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-space:=
pre">too hot. log an event.&#39;<br></span></div><div><span class=3D"gmail-=
pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98);font-family:SFMono-=
Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-s=
ize:12px;white-space:pre"><span class=3D"gmail-pl-ent" style=3D"box-sizing:=
border-box;color:rgb(34,134,58)">class</span><span style=3D"color:rgb(36,41=
,46)">: </span><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box">c=
ondition</span><br></span></div><div><span class=3D"gmail-pl-s" style=3D"bo=
x-sizing:border-box;color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,=
&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-sp=
ace:pre"><span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box;color:=
rgb(34,134,58)">condition</span><span style=3D"color:rgb(36,41,46)">: </spa=
n><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box">count</span><b=
r></span></div><div><span class=3D"gmail-pl-s" style=3D"box-sizing:border-b=
ox;color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,&quot;Liberation =
Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-space:pre"><span cl=
ass=3D"gmail-pl-ent" style=3D"box-sizing:border-box;color:rgb(34,134,58)">p=
aths</span><span style=3D"color:rgb(36,41,46)">: </span><span class=3D"gmai=
l-pl-s" style=3D"box-sizing:border-box">core sensors</span><br></span></div=
><div><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3=
,47,98);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Men=
lo,Courier,monospace;font-size:12px;white-space:pre"><span class=3D"gmail-p=
l-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-ent" style=3D"=
box-sizing:border-box;color:rgb(34,134,58)">properties</span><span style=3D=
"color:rgb(36,41,46)">: </span><span class=3D"gmail-pl-s" style=3D"box-sizi=
ng:border-box">core temp</span><br></span></span></div><div><span class=3D"=
gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98);font-family:S=
FMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;=
font-size:12px;white-space:pre"><span class=3D"gmail-pl-s" style=3D"box-siz=
ing:border-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box">=
<span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box;color:rgb(34,13=
4,58)">defer</span><span style=3D"color:rgb(36,41,46)">: </span><span class=
=3D"gmail-pl-s" style=3D"box-sizing:border-box">20000000us</span><br></span=
></span></span></div><div><span class=3D"gmail-pl-s" style=3D"box-sizing:bo=
rder-box;color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,&quot;Liber=
ation Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-space:pre"><s=
pan class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=3D"gma=
il-pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=
=3D"box-sizing:border-box"><span class=3D"gmail-pl-ent" style=3D"box-sizing=
:border-box;color:rgb(34,134,58)">callback</span><span style=3D"color:rgb(3=
6,41,46)">: </span><span class=3D"gmail-pl-s" style=3D"box-sizing:border-bo=
x">log the critical high event</span><br></span></span></span></span></div>=
<div><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,=
47,98);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menl=
o,Courier,monospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl=
-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box=
-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-b=
ox"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=
=3D"gmail-pl-ent" style=3D"box-sizing:border-box;color:rgb(34,134,58)">coun=
top</span><span style=3D"color:rgb(36,41,46)">: </span><span class=3D"gmail=
-pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-pds" style=
=3D"box-sizing:border-box">&#39;</span>&gt;=3D<span class=3D"gmail-pl-pds" =
style=3D"box-sizing:border-box">&#39;</span></span><br></span></span></span=
></span></span></div><div><span class=3D"gmail-pl-s" style=3D"box-sizing:bo=
rder-box;color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,&quot;Liber=
ation Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-space:pre"><s=
pan class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=3D"gma=
il-pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=
=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:b=
order-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span=
 class=3D"gmail-pl-pds" style=3D"box-sizing:border-box"><span class=3D"gmai=
l-pl-ent" style=3D"box-sizing:border-box;color:rgb(34,134,58)">countbound</=
span><span style=3D"color:rgb(36,41,46)">: </span><span class=3D"gmail-pl-c=
1" style=3D"box-sizing:border-box;color:rgb(0,92,197)">1</span><br></span><=
/span></span></span></span></span></span></div><div><span class=3D"gmail-pl=
-s" style=3D"box-sizing:border-box;color:rgb(3,47,98);font-family:SFMono-Re=
gular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-siz=
e:12px;white-space:pre"><span class=3D"gmail-pl-s" style=3D"box-sizing:bord=
er-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span cl=
ass=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-=
s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box-=
sizing:border-box"><span class=3D"gmail-pl-pds" style=3D"box-sizing:border-=
box"><span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box;color:rgb(0=
,92,197)"><span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box;color=
:rgb(34,134,58)">op</span><span style=3D"color:rgb(36,41,46)">: </span><spa=
n class=3D"gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98)"><=
span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&#39;</span>&gt=
;=3D<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&#39;</spa=
n></span><br></span></span></span></span></span></span></span></span></div>=
<div><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,=
47,98);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menl=
o,Courier,monospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl=
-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box=
-sizing:border-box"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-b=
ox"><span class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=
=3D"gmail-pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-pds=
" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-c1" style=3D"box-=
sizing:border-box;color:rgb(0,92,197)"><span class=3D"gmail-pl-s" style=3D"=
box-sizing:border-box;color:rgb(3,47,98)"><span class=3D"gmail-pl-pds" styl=
e=3D"box-sizing:border-box"><span class=3D"gmail-pl-ent" style=3D"box-sizin=
g:border-box;color:rgb(34,134,58)">bound</span><span style=3D"color:rgb(36,=
41,46)">: </span><span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box=
;color:rgb(0,92,197)">31000</span><br></span></span></span></span></span></=
span></span></span></span></span></div><div>I have noticed that the &quot;d=
efer&quot; which was an interval of the same condition, but if the sensors =
keep over the critical high then the event would be log every 20s and make =
the logging full(Maximum log number is 200).</div><div>So, is there any met=
hod to avoid it?Like event assert/de-assert=C2=A0that defined by IPMI sel l=
og specific?=C2=A0</div></div>

--94eb2c05636c4d3a150562e003b5--
