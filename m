Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c31; helo=mail-yw1-xc31.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tqr2fvZY"; 
 dkim-atps=neutral
Received: from mail-yw1-xc31.google.com (mail-yw1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449Rls3SzDzDq6Q
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 09:18:48 +1100 (AEDT)
Received: by mail-yw1-xc31.google.com with SMTP id q128so12428360ywg.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 14:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7mKoP3hVfMJKgKZNWEnBro1J3fehTkY8aH2Bdf36TVU=;
 b=Tqr2fvZYM6fuwY5qtZ36nMga0AguJDv+Iz9KYZhbDo9zbdjpuNgVyQsDfMRsKF9YNP
 Kig7LdbGQ7NLycC2efRiPcS9XLi6RyXdacSCWuQHVQ0rmD4tUCpsIgV1ioywoBWO6ooV
 tYrNwjw4zO9P4VwxBtaCdW1fi96ldp/cMZpeEOxaVjrNx2Wz/jV/KuXuFwunU3sIyAep
 tLS83I82mYLxwvez9a+9SsSxJuyJ42yWSvqJjlbH2G46RrxDMxXJHqCcPSV0xKGWfVQ0
 y0qduoAGjRzi2O/LaTYOYskOV6dMXUlF7ghzZ1ZUbTzssRgcjcye4AP8jOK0V3zcjlXq
 CSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7mKoP3hVfMJKgKZNWEnBro1J3fehTkY8aH2Bdf36TVU=;
 b=WDh0FdUaiIC5O7P7+HDl4N695NZVraFatLrtgUkQrBE5oCkrt/uwuYhVTtpmiQ1cZ0
 GyaCyN9aLhHRSLo0hXi+9JhxMPwKdDO3VD5WZKeVmaUKsr/3pOKMG8/iJoFDr6U8KozQ
 us3H/+fX4SkZn3S+Q2zqAZogXH0mT8AqSyK7IPicyUOat08xA21MKCsPuGQuh+FaSvf3
 UZQG2AxrnUVYuXUSBEu0CtpO7tMGt/z5fOm96YVml0XhnijFijLuSVPu0H7AFNY5csMK
 /kopfGIHu3r2Femd+CRtd+MPKoMnih6Eb2iweyW0/fcYc7k2WP3hsgqAiwc7MUEJpQyU
 j0Ng==
X-Gm-Message-State: APjAAAUcLuW4H30L7InUM3kSFt7ldvf5n9GTawCtZ22ITLG9ifa6Pfen
 fLzvYpvwZq6/qwOAkwWjaca01sStr0bqgfCyMNi26Lbo
X-Google-Smtp-Source: APXvYqz1GYdsEqSo6XEPjaxxhVZNmOjh2W3ZbsWygbabB0xNx6g8A0V1rjdGRi56HPmpTA2clpWO4aIr+ncOt1njdvs=
X-Received: by 2002:a81:1701:: with SMTP id 1mr1150949ywx.56.1551392323702;
 Thu, 28 Feb 2019 14:18:43 -0800 (PST)
MIME-Version: 1.0
From: ja az <jandraara@gmail.com>
Date: Thu, 28 Feb 2019 16:18:21 -0600
Message-ID: <CAMTupoSj09Tq=1hfdEsQBJi_aO=TVY00Qs1CC3zrmZP2R-o2FQ@mail.gmail.com>
Subject: NTP Servers - Should a reboot be required?
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 28 Feb 2019 22:18:50 -0000

Hi all,

During the Demo and Retrospective call last week, the UI design team
showed the current proposals for the Date and Time Settings panels. As
it stands, the backend has been developed in way such that any changes
in the synchronized NTP servers would require the host to be off in
order for the changes to go into effect. If the host is not off, a
reboot is required. And so, the UI designs were created to represent
this. When they were shown last week, there was hesitation regarding
the need for a reboot; some gave the example of changing the date on
their laptop and how that doesn=E2=80=99t require a reboot.

Are there resources to modify the backend so that a reboot is not
required? Is that possible even if there were resources?

Please review said designs at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318994112_2-_S_Add_Empty

Jandra A
