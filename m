Return-Path: <yutaoc1984@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::22c; helo=mail-yw0-x22c.google.com;
 envelope-from=yutaoc1984@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="de6teWtX"; 
 dkim-atps=neutral
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySvqq3LJjzDrD1
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 19:14:15 +1100 (AEDT)
Received: by mail-yw0-x22c.google.com with SMTP id q126so1742173ywq.10
 for <openbmc@lists.ozlabs.org>; Fri, 03 Nov 2017 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TNe9ULZBtI+fZwUs1uROGvWbVR70x2QfciILR3/nkKM=;
 b=de6teWtX0ELiUSFBXsi75ZHMMM/rOMdwEs0VTWn1Fz2O8MJ4ncT+Pbbp+9JUbf3PUE
 FHU8J9oV0/yKv9w2nBUzDDbQ90XS61x2K4Z/1Vp9VG8DC/SUsNU2UY4jsrGkewJlXVtk
 gFU63PsJN7wRFVtFrAyz22m5SCmmrgGaJjulVOTLLieX/L3XZzzCyvykSejeYj3F4vzo
 mmPfAxcz4MCaPtE4O49MzYE5l6GEWVfxzvYF/eFcJDSDz1k9k8moDbVdavvbjTOWRlWA
 8F9TlJhxyBqD//A8Hm7tmnUiM8qT9tuFZFG8CLH5zRVnQSoVc+d4vP5dm0u8l3BWAW5Q
 Qjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TNe9ULZBtI+fZwUs1uROGvWbVR70x2QfciILR3/nkKM=;
 b=MiroeFFChTMdx4QnIF8sBRRI6kbogjp7bWCl/ThR7CSrf91eOoZLDJ83TuSyRPjZtJ
 xhPnb/TQAgpb7ypaMQrannz7B5d+SKmWEa4qC8HGoRZij7WYfvYTT4o0rmm0MJo+S7c+
 0s5dfkvzQk3OU3Lp2q1YY0lnH0xkXc2riHK2y7avHAPVWkblOCtPsmrCQx0+f5BfKE3T
 3EDEhGwKV6CEEUKnt7CVPCkIvRph+urLnSzFRdsPKAoOqU9kdk1C4CAKAM2qnMuhqdFV
 jrP6RQ4A2bZFbp4oVXh8D+kASh3FjYCbglCJh0WPh/4UchWO/dG3czIw9PBWTbmjN8fm
 4H6g==
X-Gm-Message-State: AMCzsaWAPWdTevNvqfWYE33Ud2e+SDLqHE3TQvtirzob7WuAXJ7ZKQOv
 SvuDN++ApHq87nZtM3Z5wr+XfkrQIieKS7pG3W3OoA==
X-Google-Smtp-Source: ABhQp+RAazBYXjtXhU1k5U7RsXSngJIzB/q1gvWrLLDSMF+C0q3vpt9z00pGGazxGbhXvU/IwD1t2RVl5uQNcVc3pvU=
X-Received: by 10.37.232.1 with SMTP id k1mr3992054ybd.32.1509696852017; Fri,
 03 Nov 2017 01:14:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.204 with HTTP; Fri, 3 Nov 2017 01:14:11 -0700 (PDT)
From: tao-ching Yu <yutaoc1984@gmail.com>
Date: Fri, 3 Nov 2017 16:14:11 +0800
Message-ID: <CAJRJBYMXeaVEB0BnxzKm-EbX3fK4072TDRZRCKtNaWrXMjBqZw@mail.gmail.com>
Subject: BMC version check via restful
To: openbmc@lists.ozlabs.org
Cc: anoo@us.ibm.com
Content-Type: multipart/alternative; boundary="089e0826d3b4954638055d0fb06f"
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
X-List-Received-Date: Fri, 03 Nov 2017 08:14:16 -0000

--089e0826d3b4954638055d0fb06f
Content-Type: text/plain; charset="UTF-8"

Hi Adriana,

I noticed the version of BMC  is under /xyz/openbmc_project/Software/xxxxxxx
But I found that this "xxxxxxxx" is not fixed
ex./xyz/openbmc_project/software/13264da3
or /xyz/openbmc_project/software/aaf838cc
What does this "string" mean? Is this BMC FW related(version)? Could this
string be fixed?
How does user know the right object path and get the right information of
BMC via restful?
Because this object path is not fixed.

--089e0826d3b4954638055d0fb06f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adriana,<div><br></div><div>I noticed the version of BM=
C=C2=A0 is under /xyz/openbmc_project/Software/xxxxxxx</div><div>But I foun=
d that this &quot;xxxxxxxx&quot; is not fixed</div><div>ex./xyz/openbmc_pro=
ject/software/13264da3 or=C2=A0/xyz/openbmc_project/software/aaf838cc</div>=
<div>What does this &quot;string&quot; mean? Is this BMC FW related(version=
)? Could this string be fixed?</div><div>How does user know the right objec=
t path and get the right information of BMC via restful?</div><div>Because =
this object path is not fixed.</div><div><br></div><div><br></div></div>

--089e0826d3b4954638055d0fb06f--
