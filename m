Return-Path: <xow@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg0V130BQzDqGk
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:18:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="d0RZvIhl"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id 1so186787115qkl.3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8dR1u6bsI8hELMoyEqoty1IRKW+TmTBDq8UT28AUz+k=;
 b=d0RZvIhltv68zR3Xo6+sHkB9ZLv0LawcGYXQWky57fqOKHXtp1fThoyKHQKMkf9Nfj
 HqqlnjsfOwtnjkA7GAOJKWoMNfQiC6viz6P7XMqP675Hxx5CF7Gv2dnptkdckOKeQw3k
 rMimGHo5ItDt7NHR6EdEdUG1YJgEH4CDrxlbhmNVkZbHVGhhh8aJHmLEFRDxuD9QV1du
 JpYSsKGN17VJKfluKd4PvJPmRPo/Q1NLpaacbVXsrc4jRzopDIJGhHCHSgry26aP+v8s
 S8RY73e0I32NA99R1nFT7hW3CHpwXMNBbAmGnxbbuysNL2QcgCTieNWPoszknCVlQH0x
 M17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8dR1u6bsI8hELMoyEqoty1IRKW+TmTBDq8UT28AUz+k=;
 b=Q7DbN/AnP059YGEgcmkvJsuZOBFa300O0yayV60GXSC4s+ji4wVcgjMiMspIVxLX5u
 vsTl/xW8wRRxok+EHDRbBM9CXzgVd//6UJJJO7w1Zg7tEwvkcqNxXoLSqewjyNWCZ9+5
 f7wsnV10GWGLLXlY3NfSSaC5MxPkiqihHSdhAv6ge/11aDW4jnMaG4TliwRiB2TdHmfe
 c9bLZZQuzX/4Da2zB7EMKITqpwZRKRYqWIU/ncqw2ez6WmAD2GUcmI+zWRVuYH2RI1L8
 meOgOHGMD7XGF+ED2rIY8tZStRhcEPSoVEEn+BST7gMqDUprPSvr+XckmMIv/92CUK76
 YwAw==
X-Gm-Message-State: AFeK/H1mTEphWGqeNZl+YNAhXEKCm56HvALLMiFLlc7rsk6H5QiEyhIaPBOh/5kQ0BcsWZcJDw8iZvf1rg+2k9xV
X-Received: by 10.55.65.70 with SMTP id o67mr20741470qka.254.1489180676979;
 Fri, 10 Mar 2017 13:17:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Fri, 10 Mar 2017 13:17:56 -0800 (PST)
In-Reply-To: <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
References: <20170310122135.29827-1-andrew@aj.id.au>
 <1e540c49-0053-087b-0021-3ca259d2ca32@kaod.org>
 <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
From: Xo Wang <xow@google.com>
Date: Fri, 10 Mar 2017 13:17:56 -0800
Message-ID: <CAPH-5w5i0O=CAWw97_LGAJUShBHM6CK=_aN42UgQ-ANZzu71Ww@mail.gmail.com>
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 miltonm@us.ibm.com, 
 wghoffa@us.ibm.com, Patrick Williams <patrick@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 10 Mar 2017 21:18:02 -0000

On Fri, Mar 10, 2017 at 6:20 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 03/10/2017 02:38 PM, C=C3=A9dric Le Goater wrote:
>> On 03/10/2017 01:21 PM, Andrew Jeffery wrote:
>>> Protect against suspect hardware causing the bus to read off more data
>>> than defined in the SMBus specification.
>>>
>>> Some investigation that suggests that the DEVICE_ID command (0xfd) to
>>> a UCD9000 occasionally returns all 0xff, causing the bus driver to
>>> overrun the 34-byte data buffer provided by the I2C core with a 255-byt=
e
>>> broken response. This patch should prevent trashing the stack and also
>>> cause the UCD9000's probe to fail.
>>>

Excellent. We tracked down failures to the same error, that the
occasional 0xff from the UCD is interpreted as SMBus block length.
However, the symptom we observed for the overrun is a kernel panic:

Kernel panic - not syncing: stack-protector: Kernel stack is corrupted
in: 802e5e38

CPU: 0 PID: 1559 Comm: zaius_vcs.sh Not tainted
4.7.10-f26558191540830589fe03932d05577957670b8d #2
Hardware name: ASpeed SoC
[<801072f8>] (unwind_backtrace) from [<80105558>] (show_stack+0x10/0x14)
[<80105558>] (show_stack) from [<8016d06c>] (panic+0xb8/0x248)
[<8016d06c>] (panic) from [<80110df4>] (__stack_chk_fail+0x10/0x14)
[<80110df4>] (__stack_chk_fail) from [<802e5e38>] (i2c_smbus_xfer+0x508/0x5=
4c)
[<802e5e38>] (i2c_smbus_xfer) from [<ffffffff>] (0xffffffff)

I'm not sure that the UCD probe failures are totally related to the
bug that this patch fixes.

cheers
xo
