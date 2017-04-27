Return-Path: <guhan.sac@gmail.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDX7K0Z3TzDqBH
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 08:44:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P2OmxeX9"; 
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id y33so38124160qta.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 15:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4ne+nqvY2iQgzp6GCniDlnthoBU02Ov6XeLymjmnFxA=;
 b=P2OmxeX9/Vpf+5oS4r5wIO7mWAyiQEkhgHlJ/6VV8C/gckD7TYncVxvoJ6DFSNLMKH
 VEH5xr+FRiKsEqNZclRL/V93k+419XsOM89efoG3FYjdqJlZU7O+4C6Ly8w9LhWKe6mh
 KAOp6+SdjwHV0fmsHsjK2Nk+gHtooHGZu73/k1cZvYU4OY3QF07tYe6zpANpIItE2FU3
 xbPxs+Ch77yCfTUtR0IboYkpupsan0jyDSLt9uDUQDoMFtcY3BXLKl4O9qyjB9RS/3hT
 RLbMo2+gVOeobf2ewNRTjkx5Ab8cZp2M5Y0n357ik9Z4/OYsi0YfFNLf3BbefiXATG1J
 SypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4ne+nqvY2iQgzp6GCniDlnthoBU02Ov6XeLymjmnFxA=;
 b=BzgfrrLh3IR4dqglAmK8hDXgjhQld4T02p/Z/9W79K0hX+AcoQtczbWIxuRopfhFCA
 4REycen+EZyf3Ruijl0toPfgfLAe0fjlSHCown15i1bPWZra2rP967euPPyNCG9Bhc5Y
 dEKMy585k2wFrV5J1v2Tv2vvHC/7SUwuN1cPjixC4EP+2BLeLrpUGB9NxBIR1q69nt8a
 ll90hbfO9HtJbLHM7H18W16xqabYP1fxYt/Nd2FZh3nIyaghE9V7PMvwDTQV7up227kL
 vbVXrwnu5ud9bfVgLMRt7KsBOByDAMUyUV40Y7MD9nfXhul/Ve5oi6WdgFvP/2ZnFrom
 lqkg==
X-Gm-Message-State: AN3rC/67JQJXMje+UMlDKj5T9YcqAmuKrIbBXBmZNpWwdSOAlYN+ZLyF
 OuUzmD76B+8lm2243ZK9k7fSuVfVwg==
X-Received: by 10.200.54.136 with SMTP id a8mr8139031qtc.87.1493333049400;
 Thu, 27 Apr 2017 15:44:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.160.164 with HTTP; Thu, 27 Apr 2017 15:43:49 -0700 (PDT)
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Thu, 27 Apr 2017 15:43:49 -0700
Message-ID: <CAMNAJg1PdvWvrocgSd+04msjZgJ53X5xN5YPGjJRRjHh1LTCsw@mail.gmail.com>
Subject: Ipmitool compatibility with host-ipmid - Bootparam options
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1142833cf0fd20054e2db1d5
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
X-List-Received-Date: Thu, 27 Apr 2017 22:44:13 -0000

--001a1142833cf0fd20054e2db1d5
Content-Type: text/plain; charset=UTF-8

Hi,

Currently openbmc's host-ipmid implements petitboot options (in
host-ipmid/chassishandler.cpp) where it only implements Boot param 0x05 and
0x61.

Hence the following ipmitool command works:
*ipmitool chassis bootparam get 0x05 *

But when the following ipmitool command is issued, it fails with
unsupported parameter error:
*ipmitool chassis bootparam set bootflag force_disk*

In the opipmitool code, I see bootparam requests like 0x00 and 0x04 in the
process. The set bootflag hence, fails with a unsupported parameter
request.

Is this expected?
If so, do we just test it using the raw ipmitool commands instead?
*ipmitool raw 0x00 0x08 0x05 0x80 0x04 0x00 0x00 0x00*

Thanks,
Guhan

--001a1142833cf0fd20054e2db1d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Currently openbmc&#39;s =
host-ipmid implements petitboot options (in host-ipmid/chassishandler.cpp) =
where it only implements Boot param 0x05 and 0x61.=C2=A0</div><div><br></di=
v><div>Hence the following ipmitool command works:</div><div><b>ipmitool ch=
assis bootparam get 0x05=C2=A0</b></div><div><br></div><div>But when the fo=
llowing ipmitool command is issued, it fails with unsupported parameter err=
or:</div><div><b>ipmitool chassis bootparam set bootflag force_disk</b></di=
v><div><br></div><div>In the opipmitool code, I see bootparam requests like=
 0x00 and 0x04 in the process. The set bootflag hence, fails with a unsuppo=
rted parameter request.=C2=A0</div><div><br></div><div>Is this expected?=C2=
=A0</div><div>If so, do we just test it using the raw ipmitool commands ins=
tead?</div><div><b>ipmitool raw 0x00 0x08 0x05 0x80 0x04 0x00 0x00 0x00</b>=
<br></div><div><br></div><div>Thanks,</div><div>Guhan</div></div>

--001a1142833cf0fd20054e2db1d5--
