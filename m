Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbj90H8CzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lXHtZLjm"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id j9so3965856ywj.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jrFIkTssMzfhK5y9S57kt+pip+8H0ol+AmH471b8YDE=;
 b=lXHtZLjm1jiSXwjHe0+jPPGklxwBQutLIoefh16/RrvPmr73H0q2j3NkCkSKRFr1un
 oYQiQ6bJoRPCJtUw/WazdiayNxTOUIed1AisqJv0NXfQNcnkkQqWMM5tQICeyRdJmWzN
 zG1rceDxGOALtfGPOkKEOzUicWjjRACj8EmP83cN8v3ZrhSHLM3T/hXQkMIJQmsmGttr
 AXCy9hxggovyPBrM6PWj0i2cGcO8ZgPUs5jq4JdIKKujB0xkvjyDFYoh6Gl7azECyedB
 hWvDjzXrdXUtoLJt8pakIT4bqeXZlTTMMxB1Zp+p9D/3rNuzBVD3UCFyJxqydSKIN+sK
 X9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jrFIkTssMzfhK5y9S57kt+pip+8H0ol+AmH471b8YDE=;
 b=amXNvezWaw5M8lnwGEZP3yJkc5VKiOCGzoF3MitWdfrgFbQ40+wZa/P/PSD5x116oJ
 nPL64x9vpZoGpDzpLSZAXVoHQ7P7SbskElxAElzrUM/YOXCh0+Y/C8ff4ISNOxMe+4kd
 sKJGRgAUNmIk5aYkRdTVl/LvpUmvIBEwODD6VMHRMn028tt5QbvntNciz3KM5EtzStCP
 CdXmzA5KzABTV1mYVs/jTKbnQFvrFA6YbL9Stna1qtCC1h302rqAxOhOzhO6JzLeh+gF
 WZYLXMHdwMqH6SYQK1bhIKmpbbjFjrBBmeRS4OzBX+woT94qLrm4xqlacHBLFQN7s1BF
 jkLQ==
X-Gm-Message-State: AN3rC/6J8EE5GUO1m/l7ywCSvjWPBTxuvR0hgH+eKPniJP1AhlMYWlkG
 p+TEYNu7bSd3lAeu9ydsoBQq1Vt99g==
X-Received: by 10.13.251.4 with SMTP id l4mr6822416ywf.329.1493342714795; Thu,
 27 Apr 2017 18:25:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 18:24:54 -0700 (PDT)
In-Reply-To: <a0cb1ba8-19e0-bbdf-d343-7463395e72bf@linux.vnet.ibm.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
 <a0cb1ba8-19e0-bbdf-d343-7463395e72bf@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:54:54 +0930
X-Google-Sender-Auth: xawJA8kgU5Ta0bjXco4s0jtVCTM
Message-ID: <CACPK8XfNoBfGVtXN_gKQZMxKaK_krZDjpPq4kCcyrcR7AZ3Dmw@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
Cc: Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Edward James <eajames@us.ibm.com>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 01:25:17 -0000

On Fri, Apr 28, 2017 at 1:39 AM, Matthew Barth
<msbarth@linux.vnet.ibm.com> wrote:
>
>
> On 04/27/17 2:33 AM, Joel Stanley wrote:
>>
>> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
>>>
>>> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has
>>> a
>>> defconfig for ast2400.  If you have one for ast2500, please upload a new
>>> patch set to that change.
>>
>> I have defconfigs in the tree that are ready to go. I will upload them
>> to Gerrit when I get the chance.
>>
>> I've pulled in:
>>
>>   - Ben's ftgmac100 patches from the net-next tree
>>   - Brendan's i2c patches, v7
>>   - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
>>   - Chris Bostic's FSI series, v6
>>
>> These are going through a test cycle on the ast2500evb and Plametto
>> tonight. Once I have an ack for the i2c device tree, I will add that
>> to the tree and push to github.
>>
>> Eddie, can you let me know which version of your OCC hwmon patches you
>> want included. Same goes for the CFAM I2C patches. If you want to wait
>> for review then please ping your reviewers and we can see if we can
>> get the patches reviewed before we include them.
>>
>> Brad, can you point me to the SBE FIFO work that you want included. If
>> you would prefer to wait for review that is okay.
>>
>> Matt, I think do you want to merge the MAX31785 hwmon driver as-is for
>> now?
>
> I thought we already have a MAX31785 driver merged, so what is
> 'as-is'...does that include the update supporting reading the tach feedback
> from both rotors as described in
> issue#652(https://github.com/openbmc/openbmc/issues/652)? The commit you
> referenced in that issue does not have the dual tach feedback support yet.

No, that driver is not upstream and therefore it is not in the tree.
It needs to be included in the OpenBMC tree as part of this work.

Thanks for clarifying the issue about dual tach feedback.

Is it useful for you to have the driver merged as-is, or does it need
to have that feature enabled before you can do any testing?

Cheers,

Joel

>
> At this point in time, it's important we get the MAX31785 driver updated
> with this support along with the PCA9552 driver presence & led verification
> of the fan enclosures.
>
