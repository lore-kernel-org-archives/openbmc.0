Return-Path: <xow@google.com>
Received: from mail-pa0-x233.google.com (mail-pa0-x233.google.com
 [IPv6:2607:f8b0:400e:c03::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb8MQ1w3pzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 03:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=cI4BZ6iq; 
 dkim-atps=neutral
Received: by mail-pa0-x233.google.com with SMTP id b13so29497601pat.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=to:references:subject:in-reply-to:from:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=3YuoZ7NfmVCceXTOoEux76oMPUBnGKjKwEO9OLqtsaM=;
 b=cI4BZ6iqUq7kXc4lulZnKuB+ZBzzG2ks4zPYMMf0CCVnmaxsf8//o3SKERIQzwK3vC
 RecRrhS55hhTX7Kb6n2mr09+0cClehq1hyQFxp4DdeEEjfuHZFYbTwHPZbPGqAdP/FnO
 OPwZ0weq9KUs4bmUiF3XWc1sj5+4uBixd7LzLYW5EU/93toKlNTo5Luzh3maadC6lf6H
 OUM6jyELQD6hEeoWibvDYozIEwBM3GOTd0OMcICXDRZHFpcSMBT30vBWl6/CwCXbCw0N
 5U8WlTftmCVSqxjvJQbK3FH7u78qmCme0c68956jxYs7hREacqa5LUnheXtdGS6sc1yA
 UNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:to:references:subject:in-reply-to:from
 :message-id:date:user-agent:mime-version:content-transfer-encoding;
 bh=3YuoZ7NfmVCceXTOoEux76oMPUBnGKjKwEO9OLqtsaM=;
 b=JwEE9vNy1o5FVSVNrFpH5MKbH0toGkd/uSbmq8kaCtKeArbq/S+iDYMx4+PXkG49LO
 erou2dZlUeDo/UWfjvEaFjLg08KwJ2FmIyKY1WV6c4T3G6j9V+VXz9lP74oGQxGALlZ0
 tXLvgvU1Dotq77/Y1mvQXwXBxgfnkqDJza870K39O8Dr2X+ryUKws4hn0vRErypeA2lG
 kqySa0EG1+j+tKI3DZqAoxse4OXT9hG48cAyNW7Xs+3ioe5Ob/cON6ISevfn3wnKqkv/
 hUedX8Z2AorOc+n8eS90vTGQ5FoL8AYG5aOoudlSlCcw5uvbXt6xAsKD4XpFzUir4HKY
 HlpQ==
X-Gm-Message-State: ALyK8tJUtIOmZutc/YVxJwiYYSTmIWpuETzj7y2Im83BCluVBkSpdu7usvqIEa6fXSTOehyq
X-Received: by 10.66.248.133 with SMTP id ym5mr45223612pac.46.1466704685725;
 Thu, 23 Jun 2016 10:58:05 -0700 (PDT)
Received: from pewter.mtv.corp.google.com
 ([2620:15c:202:0:1545:4687:d697:25fd])
 by smtp.gmail.com with ESMTPSA id o6sm1659810pax.9.2016.06.23.10.58.04
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jun 2016 10:58:04 -0700 (PDT)
To: openbmc@lists.ozlabs.org
References: <CACPK8Xd_Ex+8Ln2tLcrfueOG1nFHH3JTG3iXm5s4jbrHkbMcLw@mail.gmail.com>
Subject: Re: u-boot tree status update
In-Reply-To: <CACPK8Xd_Ex+8Ln2tLcrfueOG1nFHH3JTG3iXm5s4jbrHkbMcLw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Message-ID: <576C232C.5070002@google.com>
Date: Thu, 23 Jun 2016 10:58:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 23 Jun 2016 17:58:11 -0000

Hi,

 > The names aren't the best I agree. Also, most of our configuration is
 > hard coded in board headers. We want to move the platforms over to
 > using u-boot's Kconfig system, as well as adding support for
 > Facebook's ast2400 platforms that use a different network and flash
 > configuration.

Excellent work, guys. I agree with the move to Kconfig. The #define 
configuration in aspeed's code is pretty hairy and probably part of what 
blocks the march to upstream.

cheers
//xo
