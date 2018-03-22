Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22c; helo=mail-vk0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lEvnAPN+"; 
 dkim-atps=neutral
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406ggM1pk3zF1xB
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 09:04:13 +1100 (AEDT)
Received: by mail-vk0-x22c.google.com with SMTP id g192so6203433vkd.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 15:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7BN+xpR4XtY2dXGhEuomtmLoNYZ1I8M8/QL6U72inzA=;
 b=lEvnAPN+D6HRCi1CwKXfwFWGY+QyZ8ERSzJtV05EN25HTBYPCDi3rbKaCZXlY90DkE
 RWcLzNlIfQEMcuhok3kduk9cRgFJlPkh1WYU6CggkLqVhrIPmjRcc/pmVnSTs3JmQ9Ft
 sUzaH0ifDMhO+TsVr3wE2k/flJAsTpD4pFlzCYnKVkPVd6twOnEux45iNKAPnYO5WiK6
 Q81+ICUPuQKkW8Ua/jx5eObQiYJ8NEDsJcVaXgb4XPEUy/hE6F6+Oy3H0gG64CZi+V0k
 MM3mKkeGDH+gr42cG+JkYK+BK3H6rv1i48zKUXLzlDNzTtPmORnS+T4ol13hPrXpJ7ku
 9hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7BN+xpR4XtY2dXGhEuomtmLoNYZ1I8M8/QL6U72inzA=;
 b=DqioE7JzYnnHfmfkJMJyzQvw/sAyJppQGNlbskBuGNmivcCtTUdPn6lx/4mKiiF/sZ
 BOHcOJFgAmukJERP1UVokJZwz0JlD15dBwz17EdvI8ti8mF/TDbcC0BtaYsQ3ccME3m8
 0D48HWgJu01oSv7O7UJNJ1T+/0b3JRaMi/R+Qwqe6TM8g/SQlS87+qByCES2Ezrh/PGw
 br/T7W84aCaQ9Hau8l4fMGT9g9G3AwZRUSIiGQF80uJwsXGIcVES5CZCWs9xHo+JZork
 vurTI6MZp5NdMSET+GYTjAULTSqY33GqTdhernTx47xDFK1ghYlxcn4HXVCD0mhlkj69
 h2Xw==
X-Gm-Message-State: AElRT7FyAMQr7BIkERHS1yaFiUQOmkWkpBRk7NcbkkkmaMCPWsRAWQQc
 XJoBemy5BgsPMj/KTTulk218LqHAGilaFWtlyAu/e9S4
X-Google-Smtp-Source: AG47ELuqbCcRp/RAuIPgCfCBnFGclMCvmxFFua/CBVdMo4aOP30+K8hBojzuc/a/UJ65EGSZRpgs8jS9a2Ze6tYBq78=
X-Received: by 10.31.56.205 with SMTP id f196mr12648091vka.45.1521756250853;
 Thu, 22 Mar 2018 15:04:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Thu, 22 Mar 2018 15:03:50 -0700 (PDT)
In-Reply-To: <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
References: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
 <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 22 Mar 2018 15:03:50 -0700
Message-ID: <CAO=notzcXOJzJroXXhYkNc9cawMZcsVtE_M3GMkAcOk6RZTgrA@mail.gmail.com>
Subject: Re: BMC Health
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 22:04:16 -0000

On Thu, Mar 22, 2018 at 1:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Mar 2018, at 05:24, Patrick Venture wrote:
>> The Facebook presentation yesterday talked about BMC health, free
>> memory, etc.  I didn't see anything in the IPMI spec about this
>> information, and beyond my general drive for metrics, just system
>> health would be great.
>>
>> Things I care about:
>> up-time
>> free memory
>> ... other things?
>
> * Free flash space
> * Network traffic stats

I actually have an OEM IPMI command for grabbing the ethernet
statistics that loads as a library into phosphor-host-ipmid.

> * CPU load average

Basically a cleaned uptime result?

>
> Andrew
