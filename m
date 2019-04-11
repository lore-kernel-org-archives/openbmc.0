Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hb8R9W6y"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g5Z34wMvzDqSf
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 02:09:15 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id w206so2420740ybg.5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TgunAJMoEhbdjg6s7xmbQqIugUuTCMnjSm0VT4EOEDo=;
 b=Hb8R9W6yATyM8M7GrNP57pqkAdlZATAKNxK9g2CyXD1KCsOXDMJybc2ysj58zqjRs6
 sINt/o4B536a1BFWRAIhLyX9YI7Ek7qJr94fbeWqIGY+VeXTP60u0kFkRIW5pKPWxY8A
 zkty3i+9CeZJzxEIlfdqU5nO9duBEAHQhObDcWd6ldnk2YfHNZylSHU7dMurQwQ5fKHM
 KYuDTWuDM5BaI7Dw1nHDoXaK3pF8JkRpaBNOlH5y8gopK6aQ+e/QtOaODTTtE93yHSRD
 CO5m50Vrxf8NNn+nCN9cP/84mV8Dqo/HrkbySYNrBvCpFrwdgBbM+uw0RyOcmSW6Tw0N
 RdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TgunAJMoEhbdjg6s7xmbQqIugUuTCMnjSm0VT4EOEDo=;
 b=gqsN7akUSgGFG/LMqTdF789NnpJmPDcydIH6QlBrmmYL5g8uaF0Z4/j4iyHLWfXcBq
 0m3LcqgzdYAZGvQ3KKn3uqfUUlIiQCbn4KYpal2OgQe/uQKIME9vflHvGx3v65qeaghT
 PPceGKGPHgbnlN7pA3bWw4oP4YwGb5JvTdr3e9I9nWMzXII3Ts7VM3iPvXEJBzEbosWj
 w23Jqu1Ko1kjdn85HAhoSmULp8llOuRq4MBvwJ5ZIOyziO+HAR3ZD3QHYzyWzx55kbXs
 cBTvn8QdzjU5tzPAfzZKkqDhYb97QMxj0MGTuebtEQdGnvqkyxqmR3bKtFGPuoI6wn9M
 S8dw==
X-Gm-Message-State: APjAAAVhBsYzXCKIshy1ZCgNLKLpkjPAaED9Nq/YdIoNHd/OLx5Kuc38
 FwL8YLFRxK0sG5GOduucp7E83E1jCAacHBPVoOtp7cDx
X-Google-Smtp-Source: APXvYqxO3iMfAo3NXvy6A3mQTea/el98AXDZAR6MG2y7GVxKwZ2U6W9rwY7KFqPgI4yiG73lo+1xgDnR6PAmEO6vfV4=
X-Received: by 2002:a25:db51:: with SMTP id g78mr15593922ybf.146.1554998951312; 
 Thu, 11 Apr 2019 09:09:11 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Thu, 11 Apr 2019 11:08:59 -0500
Message-ID: <CAMTupoQx93hnYS1=PrFLidr+901DJnp2k4xPghVDO8B9r2QBAw@mail.gmail.com>
Subject: Generate Certificates - GUI Design Proposals
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001e81e6058643689d"
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
X-List-Received-Date: Thu, 11 Apr 2019 16:09:16 -0000

--0000000000001e81e6058643689d
Content-Type: text/plain; charset="UTF-8"

Hello all,

We've created some initial design mockups for Generate Certificates and
included some questions in the comments section. Please review and provide
feedback.
https://ibm.invisionapp.com/share/K8NYRVZVEC5#/319042048_1-_Generate_Certificates

As a reminder: Use the right and left arrow keyboard to navigate through
the mockups. To comment, click on the bottom right of the screen where it
says '# Comments'

Thank you Jayanth and Devender for helping us develop and understanding for
this topic.

Regards,
GUI Design Team

--0000000000001e81e6058643689d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>=
We&#39;ve created some initial design mockups for Generate Certificates and=
 included some questions in the comments section. Please review and provide=
 feedback.</div><div><a href=3D"https://ibm.invisionapp.com/share/K8NYRVZVE=
C5#/319042048_1-_Generate_Certificates">https://ibm.invisionapp.com/share/K=
8NYRVZVEC5#/319042048_1-_Generate_Certificates</a></div><div><br></div><div=
>As a reminder: Use the right and left arrow keyboard to navigate through t=
he mockups. To comment, click on the bottom right of the screen where it sa=
ys &#39;# Comments&#39;</div><div><br></div><div>Thank you Jayanth and Deve=
nder for helping us develop and understanding for this topic.=C2=A0</div><d=
iv><br></div><div>Regards,</div><div>GUI Design Team=C2=A0</div></div></div=
>

--0000000000001e81e6058643689d--
