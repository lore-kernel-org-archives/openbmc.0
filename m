Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UnpUESap"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybTq9173fzDqF4
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 12:06:29 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id g35so6142990lfi.13
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 17:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I7HjvfFapD7LHlOK8r/PDfPhrg1Xd+2S6hCsLbtKcHs=;
 b=UnpUESap881QXoofQgVkv84I+OMeDYJVwq+vtNxkuiRDLq6tryVktPQWHJ+JijDRU7
 m20pKjEwbSjbw9gAKJXFo6t1/eDyZhDsczJbGNII7qLnj6aCEZaO9Oelxi9XM6bk77hk
 u1AbJAyhsJVWC/sZg4sVhmVRiJVkCBGJj6b4elsx+/FKfiHYS5o2BucBueqx7pOCorD/
 rNKZhPNYOiNVhze512jF5CvID7ETOE4I0Ot7lJKdDH53FgxcTk+vNP6Tma0/RDzt+ESr
 Ip6e0+FbFB2EwC1fHh7hkFldA1bDuttoR7DKgKnocPhHMFXf5GSumvFYQiYboUzvIsYG
 KkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=I7HjvfFapD7LHlOK8r/PDfPhrg1Xd+2S6hCsLbtKcHs=;
 b=faLrYSQgiv3nG9tDBov9V2KcaJ/RVmJDdOEltOV0b2iyw9AUyq3Tsm29YMkhZbpsB2
 ELjBgT07hqj5/kJZ7pHYcyzor7guOK/7zhkVM6S8R17GxQltH06yuQCQVr78/q/GJWKL
 WeWNrQAzwJfuBNrScE7RjWclHSF43e9UPDeQscPSfZAIS3XiaG8INwLNSy3B7/F8dykQ
 eujOb7u5OO7TJAO0/bpp6vQ1aAEHKNBzVhHt9l5eLUWC8cJJehxjUpuSNlSq6tSsaC/k
 M0pfzb2C4lXW1ScGQC/dDMWz0rfH/a/9h35QPBknr+RFcWA8B5nkiTqgv8xKER2cD8bx
 a3MA==
X-Gm-Message-State: AJaThX47gRJfIcV1oZdg1eMHtBmoGYaJ5exllw8pu0Z8dEQbQVPaJ7yT
 oR+3tVKxlrMfeTdPO6jOOVSpPgIuhh48Ag3vXbRiYg==
X-Google-Smtp-Source: AGs4zMappxisODDccZnWqgixB4YGVt0QNkS0eGWMGU30NQqqesqxWSGF8U/2Ko4TsnoHvZ9f5Cfk68EnLnG8/fhI7aM=
X-Received: by 10.25.223.83 with SMTP id q19mr3469538lfj.104.1510621585758;
 Mon, 13 Nov 2017 17:06:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Mon, 13 Nov 2017 17:06:05 -0800 (PST)
In-Reply-To: <fbe96e31-3ffd-1615-671f-935652e3ae04@linux.intel.com>
References: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
 <CACPK8Xfi_OV9sjQRauH_JbYP4H8mXFYWjfG8kAF8R5WxQZ7SKg@mail.gmail.com>
 <74db8309-6d27-d951-53fb-c3252af9403c@linux.intel.com>
 <CACPK8XcH99Fqp-kHE--wpXtGsE9_fkgUmevWdKVX4RwDSzLvVg@mail.gmail.com>
 <fbe96e31-3ffd-1615-671f-935652e3ae04@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Nov 2017 11:36:05 +1030
X-Google-Sender-Auth: iHwru2yhD2en4ao-wYEDUfPr6T4
Message-ID: <CACPK8XeDAmE6=9fX3D2wW6nC2qh1kVk4wi77SXkO3VN5ZCoeZw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 01:06:30 -0000

On Tue, Nov 14, 2017 at 10:32 AM, James Feist
<james.feist@linux.intel.com> wrote:
> On 11/13/2017 03:43 PM, Joel Stanley wrote:
>>
>> On Tue, Nov 14, 2017 at 4:16 AM, James Feist
>> <james.feist@linux.intel.com> wrote:
>>>
>>> On 11/12/2017 11:36 PM, Joel Stanley wrote:
>>>>
>>>>
>>>> This is the same as aspeed-bmc-opp-flash-layout.dtsi. Is there any
>>>> reason we can't reuse that file?
>>>>
>>>
>>> We could, however it seems a bit awkward to have this platform lumped in
>>> with open power, as it is not an open power platform. Also if we decide
>>> to
>>> modify the flash layout then this would have to be done anyways. I am
>>> fine
>>> either way, it just seemed to make more sense having them separate.
>>> Another
>>> alternative would be to rename aspeed-bmc-opp-flash-layout.dtsi to
>>> something
>>> more openbmc related instead of openpower.
>>
>>
>> I'd be happy to accept a patch that renames it. I was never a fan of
>> the opp string in the device tree files; it's namespacing that
>> upstream dts and dtsi tend not to have.
>>
> Does aspeed-bmc-phosphor-flash-layout.dtsi sound reasonable?

It's a bit verbose. How about openbmc-flash-layout.dtsi ?
