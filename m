Return-Path: <xow@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd8gF0SsszDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 08:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WnFPIlPp"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id 1so26401354qkl.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 13:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Waz14P4xetO9niZ4Je5H425FquBcqSTkfKjSFPQhuss=;
 b=WnFPIlPpOwG2kFEcXYAICZ/aHFH588ZKoPltdRHphySSJKVnKvWFBGc5cVS6F4kL9v
 ghWytjZlDlDojif2ZghbzBjwuBAerBBcfQA4QW22tqMbUZXA5iuuMxZKrnpRd6bVtrek
 yo/NRqgzR/vf3EOaIIJdC9hBsQ3sluITAFGAu7bJoGoxJ+s6YHVhtlHbMulo0suwYSjC
 /xpVKmEtfUQiFK1c53g9fKt0I4KRhL5z717s2QHL+Y0Uicb1MNBvTgzkfFfGvgqqC07s
 aU3jwNVeM91/ge7rhJtADiQCQOooz45qLiVn6bV4uf8U9PTyaOKWpOUGTmI9Un0tZwcD
 R6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Waz14P4xetO9niZ4Je5H425FquBcqSTkfKjSFPQhuss=;
 b=h/LjAFtL/D2ID02Hsa7sYax//Xhe86N46S9Yv/Jnro1MF/psbKhYm2VYbGKyLz5HZU
 Ny6v/z+grSbhQjAUSjUrWfPUOP0DdXLGDAtT2GvyhB0hZvhQdOerfcWJ+t6mv+jvlzuy
 xT4CQECUHHv2IIucSfKf+3t4YxRXF984z0aSATF93CLN9ng6hhKbC9Ab3Wny0skQ42jY
 RMibtsHyR9+/pfqg1m2Wc4bQic2aHs6NDidd99ZMUfO0KCqzerRuZ2xbFqioKZ72en0z
 Yl8vcoYHKkYP8hdRDcL8aoHvg8KJ0lhw5bzbkK3Zk/OtbIMX4bSiFD16K6q98XArARlf
 p7DQ==
X-Gm-Message-State: AMke39ndcDPEQe0/keFFbj1wyUsuHKslLz8F2BCY/gSeYrC/pACCAEDk9Sni+Ilv3CkHMEJEnj+9XIRnfX8hmQzX
X-Received: by 10.200.55.181 with SMTP id d50mr3481734qtc.140.1488921574062;
 Tue, 07 Mar 2017 13:19:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Tue, 7 Mar 2017 13:19:33 -0800 (PST)
In-Reply-To: <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
References: <20170303205920.146751-1-xow@google.com>
 <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 7 Mar 2017 13:19:33 -0800
Message-ID: <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 07 Mar 2017 21:19:37 -0000

On Tue, Mar 7, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
> Why is Linux doing this instead of U-Boot?
>

Does our U-Boot understand Aspeed GPIO in the device tree? If it does,
then it makes more sense for U-Boot to consume and set these pin
assignments.

xo
