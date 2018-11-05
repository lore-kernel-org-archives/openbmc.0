Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XqZT9NEt"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pdcF2h29zDrDD
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 03:36:42 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id q19-v6so1717212pll.7
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 08:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BBqz/4dmrqqhkp3Xsw0BXUFYr3mUmTrjcJkDVvM+v2Y=;
 b=XqZT9NEtjva0YltavSF+7x3fn2jmILbFT31qT+meQcykuVpEhlscXfRojrNjH9FGzb
 q2C9t7GRsmHgEx95x68WlazPugBC8aaW04vPGSxnqNc7rdnLGFmSIzRw5nb7TWzF2W+r
 5NubM3RnJ2Qo6f0PHXSU1lPKWuMrsanddGc9lI6kPDux54W9ignpv6D8BDJW9gwc1k8r
 PEoHPwz+wuhwE9venSvHfXYiP4FwHBunUhq7O6ZwroTc/Qq79sqWmPwTSwBJzQHiEdOn
 5wAzvtHFCoyuNtQoyMVmMLSSMcxlDUTlurXPFnshXOMswxTbOMX3Zft6Y4/LtDq41xtv
 7GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BBqz/4dmrqqhkp3Xsw0BXUFYr3mUmTrjcJkDVvM+v2Y=;
 b=Kr2Qz3yxWHOKtN94hqDDGhlgUwJ7AYt7yQOjWFGX1mVcik2j02q+SkB3IHnXmU0/3H
 uxeoSdxFX6Z0bWTjIMRja13KnUBnv8WYMfGCwi5CGyuLay2YzKABy5eyrexZfFgXMGxU
 qPM9/IQ6CARm+2zFEa14KqTaxk8xRee58hgdbEYugFW9QKjzbywuHVdBl7+LwnX97U0n
 u68a2qiJxaVA6MUnQeXCzN1iNGjIJYJFRKPLqvWvaj44yWpwv+j8itx/eD83mmXXuu45
 nP5yQBw0sEyc3mtGcqKa/J/RUMG5YVy5qwCSp2NBC6cPqfd8v/6QmOFOgy9FJE5ngHvm
 1gAw==
X-Gm-Message-State: AGRZ1gI8Eb147fteRlUcri1+o3ARMVdGBzq5tjWMTxTO+Qeoj4QCaGmV
 ZjUoG+qcky4y1B6+XgPAckWbTzGuBV58B/zHVIXKHvV2
X-Google-Smtp-Source: AJdET5dfdjmSMAbdtfZYSZMMhDu8FsPxzY3UnksOAIvflWm9qAjt3WWLLEeCrAP3WqE8A2r8lx4+WlOUpktoWgrO+RQ=
X-Received: by 2002:a17:902:20c5:: with SMTP id
 v5-v6mr22955161plg.156.1541435800216; 
 Mon, 05 Nov 2018 08:36:40 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Mon, 5 Nov 2018 10:36:29 -0600
Message-ID: <CANT4NrJf9e7KoTAHEWgN=AN8DStDNAQaB9pDyaWgGx3hSoga5g@mail.gmail.com>
Subject: Nov 7, 2018 = OpenBMC GUI Design work group
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000050ede50579ed7d5f"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2018 16:36:46 -0000

--00000000000050ede50579ed7d5f
Content-Type: text/plain; charset="UTF-8"

The main topic for this workgroup is "Process for Communicating GUI Mockup
and Design Feedback".

The IBM design team will present a proposal for using GitHub issues to
document draft designs and feedback/comments, but still linking to InVision
to see visual mockups. If others have ideas, please put a line item in the
agenda.

https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

-- Susan

--00000000000050ede50579ed7d5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font size=3D"4">The main topic for this =
workgroup is &quot;Process for Communicating GUI Mockup and Design Feedback=
&quot;.=C2=A0</font><div><font size=3D"4"><br></font></div><div><font size=
=3D"4">The IBM <font face=3D"arial, helvetica, sans-serif">design team will=
 present a proposal for using GitHub issues to document draft designs and f=
eedback/comments, but still linking to InVision to see visual mockups.=C2=
=A0If others have ideas, please put a line item in the agenda.</font></font=
></div>





<div><span style=3D"font-size:large"><br></span></div><div><span style=3D"f=
ont-size:large"><a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Desi=
gn-work-group">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-grou=
p</a></span></div><div><font size=3D"4"><br></font></div><div><font size=3D=
"4">-- Susan</font></div></div></div>

--00000000000050ede50579ed7d5f--
