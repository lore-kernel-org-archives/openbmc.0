Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TtnFOG+V"; 
 dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QXbG2cyGzDqSZ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 16:41:45 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id w30so1263144qta.8
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 22:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OH+lVer/tUz4b1Ddppoa+Ohg0DuFR8WoT1wu4lKhlNk=;
 b=TtnFOG+VPIE10nWZ5vOqSsnEAPTjMDBgaet3FAA9EC+dEAfgUEm2CeoAR3+5sIXhhS
 uLLu7fVf8Fh1ZsMjad2NZn/HrAxaFX2CrYkAs/LZrWyLtmfjiyRKrX6fzpU4m21QmZ2j
 0e/pEhKANecqKCRofkhgQ8V67pL2r+fTCPoyjuM8l9PI6QpeOA0dAR70jKUG2tjTpGVU
 BNXlvejI0iRQjCGTc/qO3d00jev4NqgzD7DEvm8M8AON/XLq71jkZRK25dkjPSmfxjys
 kQbvtLh8B8orGC4EZGmH398RjdilOeLdyDLjKR9LP/Elb2pQyvUnXbU8JroEhyO6PGxr
 wU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OH+lVer/tUz4b1Ddppoa+Ohg0DuFR8WoT1wu4lKhlNk=;
 b=B1jqZA3hBu2oD/6KdJ9THjeEK5iBSRVm/YbqUXyaM2MBjSo8genX0uT0ucv/Z1XxZU
 bt8nBcEAREbF6wdG9vD0oBVCHtGbOXh71bU2Zd944EEXj+tfN3csErGp6iI8vHE+RHi7
 uobgW+IHEY1B75+i9nC6LwTjeMTwjtWPd5KvDWtjoxcPXu5Gb3S0nZTrUsvFkXbW6jQA
 l2Al706IJQNxJQvEHAMZkWqvFkMAIRyeQt4zas4TfMcCaLP1ULHgcyfvMcseZheTR4Ap
 GBLxFgI2n869UADQrfOX+f2bKnWwfzn2PurIMfpJTlSCwWaGOmwTTg327q/4mVM04RKx
 TnAw==
X-Gm-Message-State: APjAAAVyNuVpMT1EK87V4VIHMeYFCdA7t2tbgUqINEBrUjpZvNSTIDW3
 eZk3Ksyx5JwhwHpZKz7BwWsZd8Wk3+p1CKk2ryYnAByd
X-Google-Smtp-Source: APXvYqytpmFfezI9l41eXJc+hMH8IRY7hrbbusm+NmeLABkkaGNCT93h/MCzinEpTGCx84FmfeE0uDTviTLHgBN6DDY=
X-Received: by 2002:a0c:9e9a:: with SMTP id r26mr6314918qvd.57.1553233302058; 
 Thu, 21 Mar 2019 22:41:42 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Fri, 22 Mar 2019 13:41:30 +0800
Message-ID: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
Subject: Some problems about FruDevice in the entity-manager
To: james.feist@linux.intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000038fabd0584a84fe4"
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
X-List-Received-Date: Fri, 22 Mar 2019 05:41:48 -0000

--00000000000038fabd0584a84fe4
Content-Type: text/plain; charset="UTF-8"

Hi James,

There is EEPROM (AT24C64) with the valid FRU data on my board.

But the FruDevice would fail to format it.

I added some debug information to determine what's wrong with it.

Then I found the flag variable returned by isDevice16Bit() was equal 0.
That's, the FruDevice could think it's 8-bit EEPROM.
/* Check for Device type if it is 8 bit or 16 bit */
int flag = isDevice16Bit(file);

There is the below comment in the isDevice16Bit().

/* Read 7 more bytes, it will read same first byte in case of
 * 8 bit but it will read next byte in case of 16 bit
*/
But the rule isn't applicable to my EEPROM (AT24C64) .
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
0x00
root@henbin:/var/volatile#

Could you give some suggestion?

Thanks.

--00000000000038fabd0584a84fe4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi James,<div><br></div><div>Th=
ere is EEPROM (AT24C64) with the valid FRU data on my board.</div><div><br>=
</div><div>But the FruDevice would=C2=A0fail to format it.</div><div><br></=
div><div>I added some debug information to determine what&#39;s wrong with =
it.</div><div><br></div><div>Then I found the flag variable returned by isD=
evice16Bit() was equal 0.</div><div>That&#39;s, the FruDevice could think i=
t&#39;s 8-bit EEPROM.</div><div><div>/* Check for Device type if it is 8 bi=
t or 16 bit */</div><div>int flag =3D isDevice16Bit(file);</div></div><div>=
<br></div><div>There is the below comment in the=C2=A0isDevice16Bit().</div=
><div><br></div><div>/* Read 7 more bytes, it will read same first byte in =
case of</div><div><div>=C2=A0* 8 bit but it will read next byte in case of =
16 bit</div><div>*/</div></div><div>But the rule isn&#39;t applicable to my=
 EEPROM (AT24C64)=C2=A0.</div><div><div>root@henbin:/var/volatile# i2ctrans=
fer -f -y 6 w1@0x50 0 r1</div><div>0x00</div><div>root@henbin:/var/volatile=
# i2ctransfer -f -y 6 w1@0x50 0 r1</div><div>0x00</div><div>root@henbin:/va=
r/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1</div><div>0x00</div><div>root@=
henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1</div><div>0x00</div>=
<div>root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1</div><div>=
0x00</div><div>root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1<=
/div><div>0x00</div><div>root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@=
0x50 0 r1</div><div>0x00</div><div>root@henbin:/var/volatile# i2ctransfer -=
f -y 6 w1@0x50 0 r1</div><div>0x00</div><div>root@henbin:/var/volatile#</di=
v></div><div><br></div><div>Could you give some suggestion?</div><div><br><=
/div><div>Thanks.</div></div></div></div></div></div></div></div>

--00000000000038fabd0584a84fe4--
