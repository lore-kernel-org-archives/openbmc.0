Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com
 [IPv6:2607:f8b0:400d:c04::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8j7f1LxGzDqBW
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 15:15:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jGO9IjVQ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Yoac08pW; 
 dkim-atps=neutral
Received: by mail-qg0-x241.google.com with SMTP id e35so3300997qge.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 22:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Rd0D45Dhvc5fai+aXHdbmYX0EZnARPSRTmV3/Xk3zwI=;
 b=jGO9IjVQD8gvLoal7SJwQr/rOLIjap/FAykfiUPm7o6fyKaX2znE5QnDF81r5ygbeK
 Eno6t66HAFlL8vecPSOY8IF/k4zTcsBzzJOPNddI5UWDv9UWpNmJm+nsN69bihb3Cuc1
 lVYZ2cua4KDMv2btV+Lx/xoRYLFZqn2ZzOiIzm/Q+HNpi91w3nOhYdyIc2bSmpfyRSQ/
 5+XKEyyltEJVnjoWLMHAGCzx9jBpQK/XFhuUMaKAleW9nPUSpPvkddHKLtA/g4VcOYLm
 /BXkNKFMu0ubqwbVp+z6stb6vsOpTh3icSjyIz0KR1LKxtrRlJmMA3ylEx13agc2fM69
 WfvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Rd0D45Dhvc5fai+aXHdbmYX0EZnARPSRTmV3/Xk3zwI=;
 b=Yoac08pWatdpehzj9EHde0Q2ZK1LJyl0gP9qKfW8lbwip37eTAXoMjpL5TK84dUhoH
 zjPAW7urzbeRbkF/B/9j/a4XicN/xy2a155iAdMdkPOGFgKk7+MJUI1o89TdkSi/UP4x
 GG/egxbnPv2DcvbntUkT/hJRifylmEVoMjN9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Rd0D45Dhvc5fai+aXHdbmYX0EZnARPSRTmV3/Xk3zwI=;
 b=Qm1CxWmG3wtNnww5Ttw3aUiOyXYuxsKDsWfPr78f258zYfeaG3vc1U5KWBFYxKYBY+
 DoOnfb3YYjpbngMzjaP7jdu7w/ioQ7KJgitz+3q8pPz5SNBfTHliwvXh7wsd1zxA+itj
 Y7y5tuvr7lZt58SOxBlyeW42G5zbxjQAPdLr29toD2IW/ip1jdc6nRhNZhESIbsJf00f
 Ax+QRTHsgr2FMdJTC228mIxTe/Mizms5auo3H00ayxKcoVmCxKFjG+3j/9UwQ5a1Okez
 vjm+V9YouXv4uMHBxWF9KDzTZnAj9Ne6vBbo+2p0f+mEmKkmxxnDszEhorjSmdADiEtB
 /Q7w==
X-Gm-Message-State: AOPr4FWXfmRPMu0bT4AxfF9B+E8Qd3bnpV2aA88Wl5S0tH1fDjaYZUo2+BlX3z7iP/zpewLo1CvRTNcX4Bbg5A==
X-Received: by 10.140.223.10 with SMTP id t10mr5791736qhb.96.1463548507606;
 Tue, 17 May 2016 22:15:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Tue, 17 May 2016 22:14:48 -0700 (PDT)
In-Reply-To: <1463512861-7156-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463512861-7156-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463512861-7156-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 May 2016 14:44:48 +0930
X-Google-Sender-Auth: nudKAQwkMK8bMRQe_9QpbJb2brU
Message-ID: <CACPK8XcH4358=JDGPt8jjVKNBLsGWriX7mzOUOe34fhpu4sFXg@mail.gmail.com>
Subject: Re: [PATCH linux] Add motherboard eeprom located at i2c4 address 0xA8
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 05:15:11 -0000

On Wed, May 18, 2016 at 4:51 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The motherbaord eeprom in Barreleye is accessible through i2c4
> address 0xA8 (54). Adding it to the device tree since its vpd
> contains the system UUID which is needed to be added to the
> inventory.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

Thanks. Committed as
https://github.com/openbmc/linux/commit/03d0937f69ff82c74da7afb286a037b523044671
and tagged in https://github.com/openbmc/linux/releases/tag/openbmc-20160518-1.

Opened PR https://github.com/openbmc/openbmc/pull/277 to add it to the build.

Cheers,

Joel
