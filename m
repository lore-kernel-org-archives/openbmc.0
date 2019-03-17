Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BhLrpwdF"; 
 dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44MZ9d4SzRzDqPT
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 20:42:41 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id t82so10695645oie.12
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 02:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=taW8f5WRyxx3ir5Lx3McUJa6ZeytmI6ZZYa8xcMuY74=;
 b=BhLrpwdFVMV+PG2pkfIF+Kj0RlOfAd0/PfiMl3MhK/F17kO7BiIVw3wl0KkG9F21Ia
 Qk/bUu+0fArOyy31+kJc6dI+pw+4wcOMf7d+lwS8taAuupRbP+vFA3o5qQKAk66UFnTp
 egteVxjq2eSJqoOKG1RIvqrmFs5cPLuA5kxhrvdEVBrCqtnipgpLw6aPUeewTxC1rInR
 pz2RInwqNOEuRci4nPbCss2ZDu8nJ/QA+7u00xZ15hSRmIs3isYgrtmLO1HX8GrUh5hU
 1vwlxLyx7bd3qw99299oA4lTardWSkjwMX6n864wLXy32UTtymX4Mvd4MbTgrO8jk0ms
 15Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=taW8f5WRyxx3ir5Lx3McUJa6ZeytmI6ZZYa8xcMuY74=;
 b=rA17GwGu3OXg22jsrhHKH41turDUynygO3n3suU8B7eejz2hM59YmZsq8VSRI21wOj
 3fo1LzYWy54QCsvlUYjW9cU9ca6J340gSA88xCxqZLIVsT5ZXps7o/ubLTocTJJ8G1ee
 y6hWMpQPgCyLfSAJ8zlRZglX34GPwFm83nvhjWq6YQ9N8gAZClXCv8sIavabq7bNDFuE
 Kir9yaUWz8wAiA1jUPXBHONK70it77P94rCt2Wv8Z7Td7UfByxSqR42vaNR9Ikj14XqK
 eYhVYElNqJSqJPbOVYX3AIeR5D9nUoijTYVUy3hG5M6I5rFnJEv063NR8DtgrEqUwtM2
 Q7Ig==
X-Gm-Message-State: APjAAAXy9FRYWGhP4M1hGcRJJIX0BhTXwZt2PxJnJOqEaS3JtPsdBJi4
 KP+F29dVvy00njC/08tAuVNCBVnBA4WgpoqAifWEaQ==
X-Google-Smtp-Source: APXvYqxzqb9ROUYvzLDvZNsnTj4Xq4DVcOXUXs7l6LPTAT+0kK1c/cJyhfe5ZkXikuUbcUrGVOAjttq8QnWnNXVDzjk=
X-Received: by 2002:aca:5906:: with SMTP id n6mr6453937oib.154.1552815758327; 
 Sun, 17 Mar 2019 02:42:38 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Sun, 17 Mar 2019 15:12:26 +0530
Message-ID: <CAE33tLEjmbwFE1GXyxOC1r50VVDjHNHHk2VFftK56uF5hgteEg@mail.gmail.com>
Subject: Chassis power on/off
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ad42f805844717d1"
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
X-List-Received-Date: Sun, 17 Mar 2019 09:42:46 -0000

--000000000000ad42f805844717d1
Content-Type: text/plain; charset="UTF-8"

How BMC is powering on/off the host CPU?  Whether it is interrupting the
host CPU directly for that or BMC will communicate through CPLD for
powering on/off host CPU?

Please someone share what process happens when BMC get command to power
on/off host CPU.

Thanks in advance.

--000000000000ad42f805844717d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">How BMC is powering on/off the host CPU=
?=C2=A0 Whether it is interrupting the host CPU directly for that or BMC wi=
ll communicate through CPLD for powering on/off host CPU?=C2=A0</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Please someone share what process h=
appens when BMC get command to power on/off host CPU.=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks in advance.=C2=A0</div></div>

--000000000000ad42f805844717d1--
