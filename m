Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::133; helo=mail-it1-x133.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CFyi0lHR"; 
 dkim-atps=neutral
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WCQm5JVpzDqX8
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 07:05:34 +1100 (AEDT)
Received: by mail-it1-x133.google.com with SMTP id 139so5813339ita.4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IWfwPKTxxSwqEYvv+FDwXdLuYZWDbeMTnuAG2edBlho=;
 b=CFyi0lHRJTmC2OiFZOvzWq8czI22r03skWrOrTAUD9VjgfKrISfUGTaB0+UPA6han5
 h65N6CY3QdwJe3r0hpD0r7SvTTiBKGUNJrnXTDjst5pg3rITrh/WVBykQ9Qc8KvdfaXD
 HAVadMTrqo97MOgPtobsqwkR+uDMX298bmDX963YlpX3toGyP/XsqaY4B+0OwW5AOV+b
 5Rm/JqFeAAlwhZN2Cg0YuayJgB3/AHrycc6ze17e+9LDM0/yhmUTgAgZDA2eqWPlv8T/
 Q8vhT1Nw33jJpZBuHZWvn5WsD7wgTe4oAiK3qv3B9rGmq9y3D01g2kFhlqhZMEwp9vBQ
 BaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IWfwPKTxxSwqEYvv+FDwXdLuYZWDbeMTnuAG2edBlho=;
 b=ECHG+g6xo0EGyHMqzGT9/n4AddcB7FLNzcuL3JqG3ssIo0lJjRS81lc3GSXYcK7fI2
 mhQfWE1/CbpcUtGR0ldcCBeASbHGOGQqHZDTSCJYiNQ652yAQbil+83N+nCRcolLxHcR
 YbKZal6Jq0azQQtUVyKwC248CBG0krtu6mVVCBLV6+96WADbS0G600BCYZv4TWfSP3f4
 cR2+tW8RiDpEN4YUIk2p+aIDD/Cy/uEIeN/ZrIV8NIpXfMPfizqZA/P8BBKzTHdEKXOB
 2hkPGbe9nYjayZNVKJIOQRSKsTZ+6pgmg+LdaTHjuoJitnSVoabAiwFjoYJ7OLBkoPyU
 OgxQ==
X-Gm-Message-State: APjAAAX3/oGEi5SzX9/s8zCXutad7jtcGRGd5R83EHhj9/bk1EMl3jwh
 0+Pd8otOzHbVaaD7OXZjgqwGnySZqXpigK0ciknedTFOF5M=
X-Google-Smtp-Source: APXvYqwDP+7JEN0hHtn4VuS0j/BPzNcyk+w0vItoyNdQwg/a11SnGmgS9z+tCv5fLy2szCrIMsEmkvMXugZ3JEaIQnI=
X-Received: by 2002:a24:4a4a:: with SMTP id k71mr6043930itb.124.1553889930583; 
 Fri, 29 Mar 2019 13:05:30 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Fri, 29 Mar 2019 13:05:03 -0700
Message-ID: <CAGMNF6W4jqEfuQTMe4jEMYmJpys1JFj_JxV1BL7NWp_UJ1=Qpw@mail.gmail.com>
Subject: Include BMC watchdog in sensor SDR?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005583db0585413182"
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
X-List-Received-Date: Fri, 29 Mar 2019 20:05:38 -0000

--0000000000005583db0585413182
Content-Type: text/plain; charset="UTF-8"

In the interest of recording IPMI SELs for watchdog expiration events, I'm
looking into how to include watchdog in the sensor SDR, so that the sensor
path entry in the event logging can map to the watchdog specifically.

Looks like "watchdog 2" is specified in the IPMI spec as:
sensor type: 23h
reading type: 6fh (sensor specific)

then it goes on to specify more information at various offsets.

Before I dive deeper into this, has anyone tried and encountered
successes/difficulties?

-- 
Regards,
Kun

--0000000000005583db0585413182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the interest of recording IPMI SELs for watchdog expira=
tion events, I&#39;m looking into how to include watchdog in the sensor SDR=
, so that the sensor path entry in the event logging can map to the watchdo=
g specifically.<br clear=3D"all"><div><br></div><div>Looks like &quot;watch=
dog 2&quot; is specified in the IPMI spec as:</div><div>sensor type: 23h</d=
iv><div>reading type: 6fh (sensor specific)</div><div><br></div><div>then i=
t goes on to specify more information at various offsets.</div><div><br></d=
iv><div>Before I dive deeper into this, has anyone tried and encountered su=
ccesses/difficulties?</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regard=
s,<div>Kun</div></div></div></div>

--0000000000005583db0585413182--
