Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SPF0fr9zDvYq
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 03:45:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Svsc+0Yn"; 
 dkim-atps=neutral
Received: by mail-qk0-x229.google.com with SMTP id o68so104254452qkf.3
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DvUVMc5FtQJyi87ePKV4gDbvsjoPeq5WJYkYd3+u5NA=;
 b=Svsc+0YnPsQsMqkxtNj86S3eEGQGFPheFfnczW+g/R3sctZpayn/+efXvqxOrcXVXw
 KO9bwVgLGFiBtogzW0kBgsjwkJNXvGcyugWFwLdXk2xnNcwf2+6bH1uqFth6CDPhiUeZ
 rNCIOiI24cv38XkFfGF5NytwX5MngNcsJOGVTe6bOID9GSeE6BPkOEnbNhhS6ShLsSur
 mqUwLf+oNDKq73n/Yv5uFtswSuBn8MoQ9cD0krKQ3vOpIN/Zgiex9VMAPO42uSCc5S1T
 6TpVret/UIlr+3dZ359iwIeUW3EPN0dXWaoKKNA0bW9Lyl/uxp2tlLd4ntcduNQPvVyG
 tFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DvUVMc5FtQJyi87ePKV4gDbvsjoPeq5WJYkYd3+u5NA=;
 b=i+YFqiiFG5iSoGbZooOT7Ob0oGSKnPOilZjaQOeVRxuw1P7nr1/+SjcK22v60mnyIu
 BfyTP4CuMwL03KxAoNdETBuhcOUZgzlTCIIALKFZw70wNZr8D4PHuq3Hj8YyY/lxehlF
 DTDnNPkPD33ZO/Rk3YwbxOHy+XKRfQzQrA9VxnYNCL1v6CE6GSAx0m86h/Dr0f6KSG2v
 XoQ8n7QrHCunyAxuqmMUKyhbRfWAXnwDOLsgGc5kk7EWaW/qj0ahWdqkBAFIkJh6M4tb
 kSljLUXuHP4/TwGgqWKzZu4OCgdZGzg83lJPII2dlHdcShqVKnvhq19Evj5qtwLuvBOk
 vNWg==
X-Gm-Message-State: ABUngvc6lxHUOrA2cZlhUTudiQ+JEN0yMDnDiplBzfCbpLN0+gAIA0TrHaLri4RrRtNK7DAtlCAWM5sf+gl38Q==
X-Received: by 10.55.15.152 with SMTP id 24mr14420018qkp.45.1478277902651;
 Fri, 04 Nov 2016 09:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.146.15 with HTTP; Fri, 4 Nov 2016 09:45:02 -0700 (PDT)
From: Mine <mine260309@gmail.com>
Date: Fri, 4 Nov 2016 11:45:02 -0500
Message-ID: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
Subject: How to handle GPIO differences between P8 and P9
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 04 Nov 2016 16:45:06 -0000

Hi All,

This mail is to discuss how to handle GPIO differences (e.g.
functionality, IN/OUT) between different HWs.

I went into a case the P8 uses two GPIOs, but P9 does not use them: in
skeleton/op-hostctl/control_host_obj.c:

GPIO Throttle =3D (GPIO){ "BMC_THROTTLE" };
GPIO idbtn =3D (GPIO){ "IDBTN" };
...
rc |=3D gpio_write(&Throttle,1);
rc |=3D gpio_write(&idbtn,0);

In P9, BMC_THROTTLE is renamed to N_MODE_N, and changed to an IN GPIO;
IDBTN is changed to IN GPIO as well.
If we keep the above code and overriding the GPIOs, writing
BMC_THROTTLE takes no effect, but writing to IDBTN may break the
function of its related front panel button.

So I think we need to distinguish such cases to avoid issues.

The question is, how to change the code to support different HWs that
have unique GPIOs?

Thanks!

=E2=80=94
BRs,
Lei YU
