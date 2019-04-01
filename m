Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y3T33pk2zDq6q
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 07:13:58 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 1 Apr 2019 16:14:35 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: William Kennington <wak@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, geissonator@gmail.com
Subject: Re: wantedby target
Message-ID: <20190401201435.2v3ng5vwazwh2efi@thinkpad>
References: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
 <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 20:14:00 -0000

On Mon, Apr 01, 2019 at 12:04:09PM -0700, William Kennington wrote:
>It's still unclear to me why we even have obmc-standby.target instead
>of just using multi-user.target. 

This is my fault.  It only exists because in the early days (early
2016?) I thought it might be useful to quarantine OpenBMC applications
in their own target.

There weren't any requirements driving that and in all this time noone
has commented on its facility so I support doing the normal thing and
just putting all our units in multi-user.

>I think it has something to do with host power on / off on ibm machines
>and how they pick which services to start. 
Andrew, do we rely on this somewhere?  I hope not...

>We almost certainly don't want to be using the basic.target as that is
>reserved for core system services and ordered Before all targets.
Agreed.

>
>On Mon, Apr 1, 2019 at 8:20 AM Patrick Venture <venture@google.com> wrote:
>>
>> When moving service files to the repo there is a choice.  To hard-code
>> the wanted by information in the service file, or providing a variable
>> for it that can be set via configuration (via the recipe).
>>
>> There's the default which is obmc-standby.target, there's the more
>> popular multi-user.target and basic.target -- I was curious if there
>> was a consensus or a best practice here?
>>
>> Thanks,
>> Patrick
