Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRZMF2hR8zDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 23:03:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DXRC9qWe"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id r9so2534828ita.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u0wknLexucj9/iXIjnSRHsEjoqjA3WCncaFfihf9Vpg=;
 b=DXRC9qWe0xiPcTiIavSWC/py33Bn3H1aYLoDnSSxA6MTwukPWgw3c/r3HF9Xb3wCgT
 tiCNXuS9wKmLP3bJlsc3Zbcs6V7DkJFEM5tpg5reOUBZhJqNMoHbIBscOpN7d0TGdKaD
 /x9hamLMQceIng5BzmtSWAJtc2lV4eajYQ6iKqNrhfcv0ZpjhbBkAEqljuXGk/fub1xg
 A+pQILOk2lRm07/NK2TKMXuYsURbiLP5XiBSv0vlRKsuTDQFj+EaN3uSSOTvwsb49A4O
 +rkhrcggkNebKeUYIVHV2jb0ptU7bVIq5U6X9TrsWCPQuFQ1POP+ofB1IHfmgC+oNxBI
 WiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u0wknLexucj9/iXIjnSRHsEjoqjA3WCncaFfihf9Vpg=;
 b=iWF0/yGZbAlfDzhlgkT0HNxXEKY/mK1YKAOYcnZbnFnkQ2Vcwhs1W+PSC9vNlvzg1T
 rkhKcMTPdVfH/xYAENYwhVSQzREsDZqnmh6zc3wpItJPSdShxYIIzTYSkXCsjFedEVGo
 ozt//xchdmn9K31QcPnZgZgQUuUA57uv2oIrxKgB17o1wlrTY6Ru4eOSb0wcGj6DYcT3
 igcoD7Sz519PeOwvkVh3/svRPb7hw6+OWjAZ6y+nwF+bqtDUT+O3+kJgC/fJtjr9d++d
 5nuJNfm7eFRnELEZqeXiMvCwX4zmf+vEpn18HXb+sD7a4zxhZbxDsB0O7TeegBoztsNf
 l4VQ==
X-Gm-Message-State: AHYfb5jFFNs/TY6Xx4VMICyDrbcdZ4d4T9aF+2Ao4gy0c6iuUQJFjoxF
 8CcrPkgEz70GTZo+2iwCjTmOdNnIkQ==
X-Received: by 10.37.11.83 with SMTP id 80mr3242625ybl.194.1502197381718; Tue,
 08 Aug 2017 06:03:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 06:02:41 -0700 (PDT)
In-Reply-To: <4e9e5404-c8f7-51f0-f886-46010d5bfe68@ozlabs.org>
References: <20170804032622.88674-1-cbostic@linux.vnet.ibm.com>
 <20170804032622.88674-4-cbostic@linux.vnet.ibm.com>
 <4e9e5404-c8f7-51f0-f886-46010d5bfe68@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 23:02:41 +1000
X-Google-Sender-Auth: VVZGf9iks_jloKS1UxsE82Qm5PI
Message-ID: <CACPK8XeT1EFbYTgRgwHOZM1iYyLp_9HoGeV2NnVUkL+tbgjNig@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/3] fsi: core: Add check for master
 property no-scan-on-init
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 08 Aug 2017 13:03:06 -0000

On Fri, Aug 4, 2017 at 1:33 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Prior to scanning a master check if the optional property
>> no-scan-on-init is present.  If it is then avoid scanning.  This is
>> necessary in cases where a master scan could interfere with another
>> FSI master on the same bus.
>
> Looks good to me. We may need to be flexible with the property name
> (based on feedback from the DT folks, when we send to them for review),
> but that should be fine regardless.
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

I've applied the series to dev-4.10.

Cheers,

Joel
