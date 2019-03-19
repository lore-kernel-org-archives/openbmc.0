Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q4x7Ec2B"; 
 dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NmJp1G6jzDqGv
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 19:23:03 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id c1so11323340qkk.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kD61q9ymyb/NGel4QSKo8/u8xyjQsK4InS5P0TL6d1o=;
 b=q4x7Ec2B6VpoE/ZGIIOaRlLHTMG8Dc87BxTyMUv4HPhx0UzEPuHgZXB1YMQ40Fdc94
 s9yH+enuI5U17HXznnVd7xZeQ8fYb6GON9EhxuYU03/FjCj6SIGRBZAbkb661R96dho5
 Ji2Z7DM3ilbbdeChUm7wx9OMVoAP09EL87rWo6Fs06V3fqKAZOBg3pzP5AaaKur1AA8A
 gv+dx3039rZ468+hrDxzY5MrUT4+w1/lHql/ARKbUHvJGpsYU5/hxuPHaEVhjxoj78uf
 csGgVEGQIMb3mCFLROKShAEgF/RUieJgbmy2LrgpNqY/qdsiOxginKtO0xFqjoxhLi2p
 BKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kD61q9ymyb/NGel4QSKo8/u8xyjQsK4InS5P0TL6d1o=;
 b=LsMHEdYQt3emykeSCVkXWD1SIjSvbj+cCEFNsptSJlFhxQV14DgWG9ZJZBiAUV1cVz
 eZip0yfaeuUn0ec/MDzadmICnny4YwBQqVdUqeBUX+pkvtMeiu3SGmJW1LJETLAcVged
 0jhl6DB3kDUTmvzyOacwkUv0Y0G5D5PI6mA6XajaXpZgVWdSRmKCwelXwVJd5TD4n1Fs
 rWYESjymDaIXDB3gLL5FEX2sL16zvMBKsuOCutIiB2uVZk8JR9aTT1FdunGIEnSZRbie
 iqOLsiz5qfrEPxqBlFV40uQazXwFHwpnEtNLul0YGPYE1M2MsLsE69yIpwWV6n5y+H3r
 W1AQ==
X-Gm-Message-State: APjAAAUiNB+pl7QT2RXni/ER8pbFI8miQ7G3ChYFmYQ53870bWCBkEgF
 0zpphJz7CZkHP4sYOslLf/GT03jgRne9TcHWT/Qlss8K
X-Google-Smtp-Source: APXvYqysLk+/hZT2X/PE/26GDljNWnEmfuyoC8EoOF5axHDuAK+aTtD0flVFIBkp7Z9xMUphBQUt04KMfSyp0ouQKLs=
X-Received: by 2002:a37:4783:: with SMTP id u125mr804079qka.73.1552983779565; 
 Tue, 19 Mar 2019 01:22:59 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 19 Mar 2019 16:22:48 +0800
Message-ID: <CAG9c7cBOEd3rD5zmgXVMx6m7sUHtt2ts4_H=8B8KxZ7iGMcvUA@mail.gmail.com>
Subject: [PATCH linux dev-4.19 00/12] PECI device driver introduction
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000085e96205846e3657"
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
X-List-Received-Date: Tue, 19 Mar 2019 08:23:07 -0000

--00000000000085e96205846e3657
Content-Type: text/plain; charset="UTF-8"

Hi,

We would like to create CPU temperature sensor.
We could see the hwmon file in the /sys/class/hwmon/
But we found the content of uevent file was empty.
That meant the sensor wasn't created through udev->start_hwmon.sh
Can you give some suggestion?

root@tiogapass:/sys/class/hwmon/hwmon4# cat name
peci_cputemp.cpu0
root@tiogapass:/sys/class/hwmon/hwmon4# cat uevent
root@tiogapass:/sys/class/hwmon/hwmon4#
root@tiogapass:/sys/class/hwmon/hwmon4#

--00000000000085e96205846e3657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>We would like to c=
reate CPU temperature sensor.</div><div>We could see the hwmon file in the =
/sys/class/hwmon/=C2=A0</div><div>But we found the content of uevent file w=
as empty.</div><div>That meant the sensor wasn&#39;t created through udev-&=
gt;start_hwmon.sh</div><div>Can you give some suggestion?</div><div><br></d=
iv><div><div>root@tiogapass:/sys/class/hwmon/hwmon4# cat name</div><div>pec=
i_cputemp.cpu0</div><div>root@tiogapass:/sys/class/hwmon/hwmon4# cat uevent=
</div><div>root@tiogapass:/sys/class/hwmon/hwmon4#</div><div>root@tiogapass=
:/sys/class/hwmon/hwmon4#</div></div></div></div>

--00000000000085e96205846e3657--
