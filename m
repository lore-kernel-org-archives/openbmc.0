Return-Path: <guhan.sac@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::230; helo=mail-qk0-x230.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HEDYaQZw"; 
 dkim-atps=neutral
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydzTq3FdxzDrRk
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 13:30:06 +1100 (AEDT)
Received: by mail-qk0-x230.google.com with SMTP id b85so1648930qkc.13
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 18:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=k/+pdPMKDQ62L80Mm3WWYxDBSd6Wr7OVKdwAJYDxHxw=;
 b=HEDYaQZw4F/JMBpAj3eG5yNDXn6PMvvu0KvFs9hI602P3AU+s5YFak2f9X7PZpIuuV
 Na6DqNL9dYaONiEbyHQcCbfZ9Y2no/Mt75IMdRyzDdm4uCEcHDc21V8sjHvmMqrGf3cI
 yxOzJ/+AQkRCFnldNYfZZau2GpVVaq6Rwc9+s1xMHbOfiNoBX4UDK2flYVhGPdTlBWVx
 A5F8zCdeUNQ+ZQW7uyM5TTzt1a10OyZebVOAOqBz7Zdq9l3z0TbpRFnIH7tvhmZ+GWFH
 YS4TefaeFLS7FJDZ1IJiZ+n6v7vjY7a+dGPobK2IMyLzp9yjotKJehbkesXR2gSNsU3F
 mt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=k/+pdPMKDQ62L80Mm3WWYxDBSd6Wr7OVKdwAJYDxHxw=;
 b=aFbNrylYvQdevYLf58vF4efrjmTgA57xCxN01C/P5+vBPWqPZcFYilo2agLB6Qm6GJ
 YTHSoT0Eo1RmtXeXy4x/QpGY2e+zvBNjdyOazVtUOzqo3I4FL5Rx/5hXPrhBOXwEJGt0
 yiUSum8UXaulpgNMwYwV0AqmPDCAwRWTf9VI2U4ZXj0Lwq6qZljAxO+JpMfefMlIW8Wu
 720xdXA1g2a/CIG5Y2OYeyve95T5fcf9Hm+HSLsPfBq6AYjk9KJ5wYN4qV/8GRd4PDcS
 jqcEu3vVq0QQLbmcsWRUbKMU2TJG71Mqc/iZ/Jgr3j6iyoZAqNeM6E5r/8O8mAlkww09
 J50A==
X-Gm-Message-State: AJaThX5G0NAIbuBaRh+EuGLvQ3ratGZfMaqSGWxyx7puJN/AJlVaplfO
 bgfQnu5vi0pI/bIfCTcB5efbW7a2edINCArGGInGnA==
X-Google-Smtp-Source: AGs4zMbdOxshW8NdU7ze4QpA1XP5HP9KRYGW2XobReUI32TWQ2l5tSGzyw2I2kr5OoiEZ9IidiLC6mzXlihYghyhRWM=
X-Received: by 10.55.207.26 with SMTP id e26mr11695661qkj.127.1510972203842;
 Fri, 17 Nov 2017 18:30:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.5.149 with HTTP; Fri, 17 Nov 2017 18:29:43 -0800 (PST)
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Fri, 17 Nov 2017 18:29:43 -0800
Message-ID: <CAMNAJg0Qez1EbKUEvgA1-tVbVvowQAiY0qSX21to5ecMWVc7XQ@mail.gmail.com>
Subject: Valgrind support in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1145b2de79c35e055e38a1f5"
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
X-List-Received-Date: Sat, 18 Nov 2017 02:30:08 -0000

--001a1145b2de79c35e055e38a1f5
Content-Type: text/plain; charset="UTF-8"

Hi,

I was experimenting on an application on top of OpenBMC. But apparently
there seems to be a memory leak that I'm not able to narrow down.
I am trying to build the image with Valgrind to analyze the error. But
valgrind is not identified as a compatible host.

Error observed:

bash-4.1$ bitbake valgrind

Loading cache: 100%
|#######################################################################################|
Time: 0:00:00

Loaded 2753 entries from dependency cache.

Parsing recipes: 100%
|#####################################################################################|
Time: 0:00:01

Parsing of 2046 .bb files complete (2045 cached, 1 parsed). 2755 targets,
380 skipped, 6 masked, 0 errors.

ERROR: Nothing PROVIDES 'valgrind'

ERROR: valgrind was skipped: incompatible with host
arm-openbmc-linux-gnueabi (not in COMPATIBLE_HOST)

I tried to meddle with the COMPATIBLE_HOST variables in the bb file present
in:
import-layers/yocto-poky/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb

But it seems to throw some errors with respect to certain assembly
instructions.

Any pointers would be helpful.

Thanks,
Guhan

--001a1145b2de79c35e055e38a1f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I was experimenting on an app=
lication on top of OpenBMC. But apparently there seems to be a memory leak =
that I&#39;m not able to narrow down.=C2=A0</div><div>I am trying to build =
the image with Valgrind to analyze the error. But valgrind is not identifie=
d as a compatible host.=C2=A0</div><div><br></div><div>Error observed:=C2=
=A0</div><div><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-=
size:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size:11=
pt;color:rgb(68,114,196)">bash-4.1$ bitbake valgrind</span><span></span></p=
><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;fon=
t-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size:11pt;color:rgb(=
68,114,196)">Loading cache: 100% |#########################################=
##############################################| Time: 0:00:00</span><span><=
/span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size=
:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size:11pt;c=
olor:rgb(68,114,196)">Loaded 2753 entries from dependency cache.</span><spa=
n></span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-s=
ize:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size:11p=
t;color:rgb(68,114,196)">Parsing recipes: 100% |###########################=
##########################################################| Time: 0:00:01</=
span><span></span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001=
pt;font-size:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font=
-size:11pt;color:rgb(68,114,196)">Parsing of 2046 .bb files complete (2045 =
cached, 1 parsed). 2755 targets, 380 skipped, 6 masked, 0 errors.</span><sp=
an></span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-=
size:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size:11=
pt;color:rgb(68,114,196)">ERROR: Nothing PROVIDES &#39;valgrind&#39;</span>=
<span></span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:12pt;font-family:Calibri;color:rgb(0,0,0)"><span style=3D"font-size=
:11pt;color:rgb(68,114,196)">ERROR: valgrind was skipped: incompatible with=
 host arm-openbmc-linux-gnueabi (not in COMPATIBLE_HOST)</span></p></div><d=
iv><br></div><div>I tried to meddle with the COMPATIBLE_HOST variables in t=
he bb file present in:</div><div><span style=3D"color:rgb(68,114,196);font-=
family:Calibri;font-size:14.6667px">import-layers/yocto-poky/meta/recipes-d=
evtools/valgrind/<a href=3D"http://valgrind_3.11.0.bb">valgrind_3.11.0.bb</=
a></span><br></div><div><br></div><div>But it seems to throw some errors wi=
th respect to certain assembly instructions.=C2=A0<br></div><div><br></div>=
<div>Any pointers would be helpful.=C2=A0</div><div><br></div><div>Thanks,<=
/div><div>Guhan=C2=A0</div></div>

--001a1145b2de79c35e055e38a1f5--
