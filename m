Return-Path: <abhishekpandit@google.com>
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHg7k3Y04zDvP3
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 06:09:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DNJdwE+E"; 
 dkim-atps=neutral
Received: by mail-ua0-x234.google.com with SMTP id b35so70197231uaa.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=QP0DKmzxJE0eLh3WbADAcoATv521Ob8nEFHC7DkMIUw=;
 b=DNJdwE+E6Hr9k5/jOXMlu/SDU44Yt2F1qiXb/+JEKFQHjXHi2N7XIt3fuIrVGf93Kq
 Shz6yNDid9QOAF4xdoGmdVxnypR4uvpolVyWZw0zhssDt4Z/+yjQTWMWNqKxjI7QNm9p
 2HPuIZRLfDrrag1obj5FqaG7xeqIlI89JWw96P0h5tZTieYtNynUM0oWNvU69AlGpWtX
 JB3dS1q4tdifX+drw8m48BlB4ESCDyzjf1rPFnf0qF96lPtMezhs8Efo59sV2MlOCWGK
 lq+yLhd7bZljKDb75LVlTksdYJXy+yoMWZdQk+bHK+yNeTiliBaxU5R+3SfDfdeBUlFX
 UL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QP0DKmzxJE0eLh3WbADAcoATv521Ob8nEFHC7DkMIUw=;
 b=ia0G1gvlhSQCE+FRjSoMP7rlkNb3D5jJcQ7BNKMyn2/U9mXMK+AvmNaJdCKBpXyW2w
 szC7MIHr8etz9hPStnCLJ1Q+aY5u+R9Q66phoWmP3oOoqz/oPoHVHbAiacjg3cqdDoZ1
 0u6nCO/XPDPtJqxO8zQbE8uarke4sCrvXeqtkdp4Kw6OPW3AOvIJJzvcnPQLe7v27byT
 zXjU/vbx7TUxo7Rr+IwHSzt5E3lgyzkineW/MfzGdA5dK87gkDi4gXNagD4+qTASGtn+
 eTpqNsUW9owU1fGL6cO8t9w0dvwumU63Y2QWIz1AqQ6X/GUSCd7LmqaeOkb3t8TMYrcG
 88sQ==
X-Gm-Message-State: ABUngvfFXbDe/2trqUA9779z27shaiMiQ1XnpmtI34xMC0tjHzQqZ0HWoSQll89eXakswAN6JjYWTUvBF3IYwHLs
X-Received: by 10.176.16.75 with SMTP id g11mr8876903uab.5.1479150590948; Mon,
 14 Nov 2016 11:09:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.83.151 with HTTP; Mon, 14 Nov 2016 11:09:30 -0800 (PST)
From: Abhishek Pandit <abhishekpandit@google.com>
Date: Mon, 14 Nov 2016 11:09:30 -0800
Message-ID: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
Subject: Refactoring skeleton flash control
To: anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org, 
 Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary=f403045e1d208b69ff05414795fe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2016 19:09:55 -0000

--f403045e1d208b69ff05414795fe
Content-Type: text/plain; charset=UTF-8

Hey Adriana,

I'm planning on refactoring the skeleton flash update code and pulling it
out into it's own repo (openbmc/phosphor-flash-control).

I've started with how I think the dbus interface should behave:
https://gerrit.openbmc-project.xyz/#/c/1166/.

The overall plan for the flash interface in my head:

   - REST (or some other) interface receives image + signature to update
   flash
      - Gets saved to filesystem and flash control is called
   - Flash control loads the files into memory and verifies the signature
      - Reference implementation would probably just be pgp
   - Flash control locks the flash device
      - This needs some more thought and probably new dbus interfaces;
      important for host flash
   - Image written to flash
   - Lock on flash device released
   - Signal asserted (Done)

---

For the most part, I don't think I'll rewrite too much of the existing
skeleton code except to have it use the c++ bindings (continue using
libflash and existing MTD devices for bmc update).

Locking the host flash would require some additional thought since
currently it's accessible directly and a mailbox approach would also
require some way to lock the flash when doing read/write.

--

Please take a look at the gerrit. I'll start adding some more information
around locking + signing this week.

Abhishek

--f403045e1d208b69ff05414795fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Adriana,<div><br></div><div>I&#39;m planning on refact=
oring the skeleton flash update code and pulling it out into it&#39;s own r=
epo (openbmc/phosphor-flash-control).</div><div><br></div><div>I&#39;ve sta=
rted with how I think the dbus interface should behave:<a href=3D"https://g=
errit.openbmc-project.xyz/#/c/1166/"> https://gerrit.openbmc-project.xyz/#/=
c/1166/</a>.</div><div><br></div><div>The overall plan for the flash interf=
ace in my head:</div><div><ul><li>REST (or some other) interface receives i=
mage + signature to update flash</li><ul><li>Gets saved to filesystem and f=
lash control is called</li></ul><li>Flash control loads the files into memo=
ry and verifies the signature</li><ul><li>Reference implementation would pr=
obably just be pgp</li></ul><li>Flash control locks the flash device</li><u=
l><li>This needs some more thought and probably new dbus interfaces; import=
ant for host flash</li></ul><li>Image written to flash</li><li>Lock on flas=
h device released</li><li>Signal asserted (Done)</li></ul><div>---</div></d=
iv><div><br></div><div>For the most part, I don&#39;t think I&#39;ll rewrit=
e too much of the existing skeleton code except to have it use the c++ bind=
ings (continue using libflash and existing MTD devices for bmc update). </d=
iv><div><br></div><div>Locking the host flash would require some additional=
 thought since currently it&#39;s accessible directly and a mailbox approac=
h would also require some way to lock the flash when doing read/write.</div=
><div><br></div><div>--</div><div><br></div><div>Please take a look at the =
gerrit. I&#39;ll start adding some more information around locking + signin=
g this week.</div><div><br></div><div>Abhishek</div><div><br></div><div><br=
></div><div><br></div></div>

--f403045e1d208b69ff05414795fe--
