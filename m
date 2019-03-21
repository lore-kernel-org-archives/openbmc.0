Return-Path: <jainmjo@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=jainmjo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QccIxGIF"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Q9b74NqmzDqSM
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 02:25:22 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id q24so5778973otk.0
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W9nC+anR1GP81qnx7Lv1KZctnN2y14g5Nuhaoqmvv7U=;
 b=QccIxGIFqyU6tmpohmSFYq3/O3hNbbK43C6XQQ98p0WQ6xhxr7J/lQeV+wmYLTPb9h
 6eieuilddPRcEGmg8ziBl+y0kjMJ8TRTgSlvTN6lUeQ6Vj9LreABGwMlPZaGvChBfq46
 cjcnmbWXRdNmWzJZsQLhkwwolL/7pjFDox53EKsRuxMMe2D2tn2sXNcF7O/7NHENhC2W
 t6QwBgLSq/cZyNBpbN3rCX09seH2/jj/ztgX7FvNDCuv2UriPhhN473c4fxt9969wYi5
 KXp04kqPiJ2j9cXkO2hMrPfTXWbsqI59He8034/V6cFMOP7BfAcxLdZ7NNUPUq95+Z/B
 5Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W9nC+anR1GP81qnx7Lv1KZctnN2y14g5Nuhaoqmvv7U=;
 b=nAU8OVjFY4ApnCfpdFdWFRF+TRi0jnup34XEJk+DQ5qC6Elg8hhOtC7kDnAap1FnM8
 TfZO+3Pez/DHc4OGSo4ZrNxLiaPcfsCvo7anvbOtXz4uWSJeYFJDp7oGpki0udVx2rTn
 6s4ZJi39NG93Pt4InzsWJzlnbPQKk25rQrkpH9EzQPIZ3+kr7+kKCHS/IScGThTH64u/
 mkaIhtDbqjywTiVsaLQFNgl3cY9Q5ov3eYBy7fAP0EKZy3w8xHYDWfGeAAhFjjiR2uuT
 C8qOW0++85YgtBQ1IcgAuYJlJxWidiF+p2o6q3UL/gDVYrTklPyYmfxSdmngdaxjg5js
 n21A==
X-Gm-Message-State: APjAAAUzGFaI5AFlwzkorHjQoDj8mHPhcQ2LHA6Hvx+FZAnwlOKMzb13
 h2piJWBwFGuBUK5rbpDw7zTPWI/ukH6LPZGIwjmvKfhG
X-Google-Smtp-Source: APXvYqzahApHqBbQWFwKKMQYHmAv8I2q2qKMtdRbaP61bGw4FXWTXkEU3KUg3PZW7mVbYdwtuoH7j1LlhZHBN3Dje6o=
X-Received: by 2002:a05:6830:44:: with SMTP id d4mr3082505otp.39.1553181918916; 
 Thu, 21 Mar 2019 08:25:18 -0700 (PDT)
MIME-Version: 1.0
From: "jainmjo@gmail.com" <jainmjo@gmail.com>
Date: Thu, 21 Mar 2019 20:55:07 +0530
Message-ID: <CADc45smtLBVn9vSh3uEcMWEwcnUo+asYZR5pXgFKP+5xkuK7vw@mail.gmail.com>
Subject: OpenBMC Development Kit
To: Openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008c73c905849c58c2"
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
X-List-Received-Date: Thu, 21 Mar 2019 15:25:24 -0000

--0000000000008c73c905849c58c2
Content-Type: text/plain; charset="UTF-8"

Hi all,

My team at Flipkart is working on porting OpenBMC to our servers.

Do you recommend getting Portwell's Neptune Alpha OpenBMC dev kit to play
around with OpenBMC and get familiarised with it before jumping to actual
servers?

Thanks
Jain

--0000000000008c73c905849c58c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br><div>My team at Flipkart is working on por=
ting OpenBMC to our servers.</div><div><br><div>Do you recommend getting Po=
rtwell&#39;s Neptune Alpha OpenBMC dev kit to play around with OpenBMC and =
get familiarised with it before jumping to actual servers?</div></div><div>=
<br></div><div>Thanks</div><div>Jain</div><div><br></div></div></div>

--0000000000008c73c905849c58c2--
