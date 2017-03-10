Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfSDW64RkzDqC0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 11:04:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZFZtCa0"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id h11so2114908ywa.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 16:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tkUsBJX9tLrgyRXPhT1T1yokdg03+YNSSYCXvNgCJm8=;
 b=aZFZtCa0wNwX21Nmn949ht/o8U3vVGpV+y8cuQGAm/WLM2Q8uP93jBDYl32RrAO3vD
 FlZlWKJd+IIILwGQaKfZuOHMmtNNeOtQ3c9s4D9x4Xa44vceAlWNJwjq8IgUyQebo9rR
 SBTTQmSkVmMfVkhDW0FAb0sboBHTzWpWWQoK4RHOLoHZe6pV77X+315I/0oUTkhlP/ZN
 GvnDuXZX9/lzlflCwoLwwDJdNo/oQXR3gcw4IzuTrtyEzvKSRzGT/Zs3Fmbz8jaT3UDp
 AaMovVUYQtKdBlY2RsIoyoPBnyGTgi0a1dYMeC+HqWQAlmpvaTSkxgQJCbm/11E1PV9z
 tNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tkUsBJX9tLrgyRXPhT1T1yokdg03+YNSSYCXvNgCJm8=;
 b=ir1Wmyli9hhHhXo66dk7TbIKKbdDoIobyPA82uVVGytTuSNYb2EC4whfyr12bBTecx
 IlbT7vesDR5YZ25YF/cxF4qYLB0cZei0dKlJHmpyUka7vWY2b9ogjdWLs7bOReBmxvT/
 ftITSvsFHKjj+mMtZdR5cQrIYG2bNifpuAY/Tn9EAwobivPC2AkMA4XS2h8bQjpdaVQV
 iZInrovDwM9T/WMcK7AHa1ufJ2ZqbpHuzO4txbttVDFP/VDTwE2L4eMx8yDWLnOglU0r
 JbBtSI2qfoN0XocShSAd7ZVLz7f2n2R8p4o7N9ORxTiwfQz4zSk7ItWjjDaoW71jaeAy
 XFOg==
X-Gm-Message-State: AMke39k9rabyrO3j9J1Jm7+bZgt8mZ4QN/xPbthLO5klPKhtwo4ztVpz8DcJsiw2Rou30LW/VD9JXG3e1Nccxg==
X-Received: by 10.129.118.82 with SMTP id j18mr5774797ywk.10.1489104265569;
 Thu, 09 Mar 2017 16:04:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Thu, 9 Mar 2017 16:04:05 -0800 (PST)
In-Reply-To: <3cc9d8a3-5595-9f37-ce2c-6354dcbb1300@linux.vnet.ibm.com>
References: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XeqJ47Sj+X1ZpPKRUBFrmwaZzT1YDNwUBHRvxzZcAXQOg@mail.gmail.com>
 <3cc9d8a3-5595-9f37-ce2c-6354dcbb1300@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Mar 2017 10:34:05 +1030
X-Google-Sender-Auth: 1ODYbOBywMCQ8-j5XVGGuqS30U0
Message-ID: <CACPK8Xe7BfLss38CbkMDMVRHpOiB5WP+7oqhWw+gQmEd9Wc4Rg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Flag FSI bus errors with
 dev_err( )
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 10 Mar 2017 00:04:28 -0000

On Fri, Mar 10, 2017 at 1:28 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
>
> On 3/9/17 4:51 AM, Joel Stanley wrote:
>>
>> On Thu, Mar 9, 2017 at 10:32 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>>
>>> Currently not seeing details of any FSI bus errors that may
>>> occur.  Send info via dev_err so that the type of FSI bus fail
>>> can be determined.
>>
>> Are these really errors for normal users of the system?
>>
>> I think these will only be useful for FSI developers. Use the dynamic
>> debug system for having developer errors.
>
> Hi Joel,
>
> On second thought I think the dynamic debug facilities will be enough.
> This change will generate more spam to console for benign bus errors during
> the normal scan process.   I'll cancel submission.

Thanks for taking the time to consider. I agree that for now it would
be too much noise.

As the driver and userspace matures, we should make sure the userspace
performs appropriate error handing and logging.

Cheers,

Joel
