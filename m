Return-Path: <hkwilliamson@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c34; helo=mail-yw1-xc34.google.com;
 envelope-from=hkwilliamson@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHv7eRzD"; 
 dkim-atps=neutral
Received: from mail-yw1-xc34.google.com (mail-yw1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445kdD5K6fzDqW6
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 08:15:09 +1100 (AEDT)
Received: by mail-yw1-xc34.google.com with SMTP id p17so1383379ywg.0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 13:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7ldRWz+aK76t4/sHe69pron0JwI7TWnayt58316voOo=;
 b=ZHv7eRzDXyiL/2EmpU2gF4R89jkPlquG6o9r1upfj77xSzsOlGUyFmB9aHEVVw6r25
 EU81NI/J+Je01kbEN/9naw8pSXx3raluWeP+w8vJV4OoxvO1XDPejDQ/RxyM5FhP+BiQ
 YOcXiH2AMHnLLFwzZuwn1ybF/0sXixtHo/xb0nOSLmuYnkAwY0GS8tJ07b7HQvPfT0bD
 h3mRkKp4OS9Dc0QnKhBTzkSkgPgyVI9U+K/9pjuK2xTHZbZmrsPAzftdOUevzGkrSmqP
 eV4pj7njXwv19dn6k4hpsf3MvPoPfw/Pgpjf20XhOgon3tWZD9wb/EnB6x3mhHPhZAaI
 GCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7ldRWz+aK76t4/sHe69pron0JwI7TWnayt58316voOo=;
 b=QB7EmnHZzGJZCAAfuXt1XnZ8ZvJvEw1fOMt3c37OSzK9RiHfKEl2Lu5CNu+SJsShz8
 D94Vk2RRNvxQYQV573XtgpJCfYNyTOBlJImqXTKj2tl0/vRREid/5Cx6QywlXu/0llnm
 nGWVdrU8nUTXmmlLO8affuYTPiIaKjOyX2RG8ZgkUSnFyp+gylXp89txwPIa+QNujsdg
 JTIKs/w93xlEa8odKazKKzgeoLTbXKokkGlhVnpa8FMhNmf4sIbsv0IyYPdOIJ4KZF9Y
 sopTakiyvvHaAV5b/uAicLqHE6lWJUT/y2QtizdjC93gwwPYBkOg2ePAmKmJHPPR7gw6
 2g1w==
X-Gm-Message-State: AHQUAuZW5O7w9Sgql7gy+0VcKUiBik6R16LHdQAT7QS6w4FSEtHsTXJp
 78+9AWZ/t7ynUkidpuiwLYoNMTe3cZLbyfky95VFuQ==
X-Google-Smtp-Source: AHgI3IZtgfAv7H7pdpI5qFznpRcDRCUKZaBctKkClgoU707R1IIH6vzIgDh/2F0aQb9T1pwaqtbAf/1GG+fHD81G4Sk=
X-Received: by 2002:a81:ad8:: with SMTP id 207mr5010783ywk.188.1550870106692; 
 Fri, 22 Feb 2019 13:15:06 -0800 (PST)
MIME-Version: 1.0
From: Keith Williamson <hkwilliamson@gmail.com>
Date: Fri, 22 Feb 2019 13:14:47 -0800
Message-ID: <CAFweeiT62MGOER0WMGMhvR5EX4t=7+pwp1p2BO7rYEq6e+qDdg@mail.gmail.com>
Subject: DRAM usage on AST2500 with OpenBMC and Redfish
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000cd61c605828215b5"
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
X-List-Received-Date: Fri, 22 Feb 2019 21:15:14 -0000

--000000000000cd61c605828215b5
Content-Type: text/plain; charset="UTF-8"

Hi,

Just starting to look at OpenBMC for next server board implementation.

Is 512MB DRAM on the AST2500 more than enough for OpenBMC, Redfish, etc or
is anyone in the community recommending 1GB DRAM?

Thanks,

Keith

--000000000000cd61c605828215b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Just starting to look at=
 OpenBMC for next server board implementation. <br></div><div><br></div><di=
v>Is 512MB DRAM on the AST2500 more than enough for OpenBMC, Redfish, etc o=
r is anyone in the community recommending 1GB DRAM?</div><div><br></div><di=
v>Thanks,</div><div><br></div><div>Keith<br></div></div>

--000000000000cd61c605828215b5--
