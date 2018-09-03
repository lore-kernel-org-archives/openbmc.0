Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22c; helo=mail-oi0-x22c.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D0uIcdE3"; 
 dkim-atps=neutral
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 423fVN6QRmzF3BT
 for <openbmc@lists.ozlabs.org>; Mon,  3 Sep 2018 16:01:32 +1000 (AEST)
Received: by mail-oi0-x22c.google.com with SMTP id 8-v6so31712954oip.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Sep 2018 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fG8KyK6PQgmjk7XChPdO8IjCO5ZcgKYGc6OJLbAtZOs=;
 b=D0uIcdE3jSeK3FuDDxHFzWR/TK9klx2+EvpV59eh1doZPfAl63yzsD0ML7G5QKpEAg
 Va3tFTNKzBKpNSZL37m/7x2+2a4gEqs+uO4isDnGPSld4e6umUrH3z51nXBAv6F72QBI
 17hPY5jaKvJcPH2cKr3cN2EQ5KmH6ldWBOJx8D3X9UqHyMDl91skrOdMmSDO4Y7bnVme
 6UQsNKzvAiKcWRGAGc2yKGPoeTUk6/zr/U+PENF/96tOzxYE//uqT6qrYiRWxNEg+6pi
 5ZCfaKhIQuS3sLVoHkg0OxevgRY/0RyE4VvYjHR818Iw0fRgWb9RjkQtZYnxnHH7AEXa
 WVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fG8KyK6PQgmjk7XChPdO8IjCO5ZcgKYGc6OJLbAtZOs=;
 b=kmbd/XfO2EPpSCmy3CoqldtWBIWpQXFCG8EVRWwfuTIccGILriEvHzzROB/2iIEyF5
 95bFyw8VdNhTNKkJ16Ce+BpB7M8shY7krnRO1TTzfNwBn8WnShK1Ay/0HG4jRm0NPrDn
 iBVt/8ZqftNwe3geqRa7UtwosiU59dcflpZSqLfLMRuENOhcH32/unuK/bNDLIOGYQH2
 /bV3TPfMbnJgjHMmsb2C4TIXXvLsOL0cC2JmnrmSNx9Oa3eIxvkmHxQIYUSW1UKqnD0R
 bpVRb4wadYTMP2SaSrnnCCPq6+koVNSa0JiKiLaasm+GMeEWOJ6Us3ni4p1A089vAQQA
 4Dvw==
X-Gm-Message-State: APzg51AUsUn6KLK4iS4yVkd2tIA/lEzQLV2egdMHtzYRk5H3Xp1beEk7
 KF8AZhunHBBUDhKKs/u5OvR8nX5/myRTX5dSvOh/ZiO3
X-Google-Smtp-Source: ANB0VdZNrOXbqtg0C9cy4VmsRVXwn53uvka0MBExvtwzKXs0srCcsIIRYN4jmxHwg1lfxItvGrkxON4q47ID1vmsaZ4=
X-Received: by 2002:aca:f44d:: with SMTP id
 s74-v6mr17000806oih.102.1535954489751; 
 Sun, 02 Sep 2018 23:01:29 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 3 Sep 2018 11:31:50 +0530
Message-ID: <CAE33tLG+MZOg8-O76kXruUYeC=c=pLUEU4UuV8+bO4sqhegTJA@mail.gmail.com>
Subject: Temperature Sensor not showing up.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c0bde70574f14527"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 06:01:33 -0000

--000000000000c0bde70574f14527
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed
AST-2500. The board we are using have a temperature sensor in I2C interface.

When I am executing the command *curl -b jcar -k
http://root:0penBmc@169.254.8.221:18080/xyz/openbmc_project/sensors/temperature
<http://root:0penBmc@169.254.8.221:18080/xyz/openbmc_project/sensors/temperature>
*it is giving reply as *curl: (52) Empty reply from server*

Ipmitool command: *ipmitool -I dbus sdr elist full* also not showing the
temperature sensor and its reading

Please someone help to resolve the problem.


Thanks and Regards,

Akash

--000000000000c0bde70574f14527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,</div><div>=
<br></div><div>I built OpenBMC Linux using Zaius configuration and booted o=
n BMC Aspeed AST-2500. The board we are using have a temperature sensor in =
I2C interface.</div><div><br></div><div>When I am executing the command <b>=
curl -b jcar -k <a href=3D"http://root:0penBmc@169.254.8.221:18080/xyz/open=
bmc_project/sensors/temperature">http://root:0penBmc@169.254.8.221:18080/xy=
z/openbmc_project/sensors/temperature</a> </b>it is giving<b> </b>reply as =
<b>curl: (52) Empty reply from server</b></div><div><br></div>Ipmitool comm=
and: <b>ipmitool -I dbus sdr elist full</b> also not showing the temperatur=
e sensor and its reading</div><div dir=3D"ltr"><br></div><div>Please someon=
e help to resolve the problem.</div><div><br></div><div><br></div><div>Than=
ks and Regards,</div><div><br></div><div>Akash<br></div></div></div>

--000000000000c0bde70574f14527--
