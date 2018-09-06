Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oFIf9B4O"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OdJnv7ag"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425hJR4zMmzF09h
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 23:29:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D180F3E9;
 Thu,  6 Sep 2018 09:29:55 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Thu, 06 Sep 2018 09:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=fqJolgjwHmChR2NulPZdd9QlsfO7H
 p7KHlIaOh70JI0=; b=oFIf9B4O2hRZE23j4Bqb8DGzTefNSirD4DLM/LBr1Nztd
 5w2UofbUxK8p77IYolht7WPhleC3RBXdsHmK5VHOhaMuCINaFPbw6blanFK2ZPRD
 x+d3ZSps4Y8Kcox8MNLJUqWXtfRLpgJLzo0A6LOgwd5kMgiUvACLYr8fY8//I4Aj
 02ktVaSQJqIQDakmh82jKcyj/JHzBSJ8JId1vATluRjdmkarmPcCLDvGhzwskV8f
 yPya5BzHvOkq8RUaJ1J90tWuKQqYoczd2+u3HedL/qyqtw+Lc3Pw1QL6JjDZPELh
 N7DZMNGnNhCmjUPDpictVzqcAhh1426Ad60iX4SoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fqJolg
 jwHmChR2NulPZdd9QlsfO7Hp7KHlIaOh70JI0=; b=OdJnv7aga7lHOtXlbVPKOY
 OSCDf5lGNY/7eN1Tj1h8uKOvED06GN2VQZsMKKTL8eyfVt30nlCtbAwSHoa9nSMA
 +XMubzF/3rTZ4HkX2u+LNzSiVGUt/csQc+f4haDwyYaJDvAovupdzvS3Of+rzDbg
 OEAiWS8r7qkw0Pwm0gmMJGQ3RaxHnlrjsBAg8MdY3wZZuH0KvVzmvkT2br2iEks0
 Dd5JCSQ+B96xrf6l+O0mfs4q3gB0p2QpUe1994PWIaYVNBP/89v+nJq03kO4h0FU
 XAlhPgxe8McP8rueOVTwX2eYtj/SQUGqp5XTCZGHFKCPAETTE6vZZrWjDAjzyysQ
 ==
X-ME-Proxy: <xmx:0SuRWx4_Tl_aRLTuTqZIk84ZnnBVVDqpLry_8-rMUVqKs1wbFWAtbA>
 <xmx:0SuRW0LnisubM0kQbhNUwi6pbSNb1Wb57p_W9f3JM00zlHqiYCV_gw>
 <xmx:0SuRW7ESDgfZFDAhy1NoZ1Xr_jUzsVWlh29lKgvfEwT-KNYSG0aDvw>
 <xmx:0SuRW50XvCDQKuis9jPTanHb97WATD9Qi9TuFzuZ-Annm8rzqajdkw>
 <xmx:0SuRW1yqIY3h8aG4_1ABvdhVa5GwJeF_Qx3MB48AYxZr3JUMy4jE5A>
 <xmx:0yuRW5KoiHLUdvR6L3NnRWRPW99xbJvGfF9se4xBvaZx1Rj2l0GAxQ>
X-ME-Sender: <xms:0SuRW1xhZRPur9yFAKjAeaSLc1UT0zbuOFRk0--h9EB7Ii1McrLj2g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id A62C162673; Thu,  6 Sep 2018 09:29:53 -0400 (EDT)
Message-Id: <1536240593.3745516.1498902568.44FB0FD8@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, kuiying.wang@intel.com
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@yahoo.com>, chunhui.jia@linux.intel.com,
 kunyi731@gmail.com, james.mihm@intel.com, ed.tanous@intel.com,
 james.feist@intel.com, chunhui.jia@intel.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, yong.b.li@intel.com,
 cheng.c.yang@intel.com, qiang.xu@intel.com, hai.v.nguyen@intel.com,
 Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1234af23
In-Reply-To: <CALLMt=p=tmhvNfcfc50tXEGu7nuHS1huTgm3v3y-r-DuAu=zEw@mail.gmail.com>
Subject: Re: About new gpio API in linux/gpio.h adopted by kernel 4.8
Date: Thu, 06 Sep 2018 22:59:53 +0930
References: <959CAFA1E282D14FB901BE9A7BF4E77249E0C0B0@shsmsx102.ccr.corp.intel.com>
 <CALLMt=p=tmhvNfcfc50tXEGu7nuHS1huTgm3v3y-r-DuAu=zEw@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 13:30:03 -0000

On Thu, 6 Sep 2018, at 22:17, Andrew Geissler wrote:
> Hey Kuiying, this seems like more of a 4.18 kernel question for
> Joel/AndrewJ. Put them on cc.
> On Thu, Sep 6, 2018 at 2:30 AM Wang, Kuiying <kuiying.wang@intel.com> wrote:
> >
> > Hi Brad/Andrew,
> > I found the new gpio API adopted by kernel 4.8, is not fully ready, all the lines are "unnamed".

I expect this is because no-one has given them an name in your devicetree. For example, here's some output from a system I have handy:

root@witherspoon:/tmp# gpioinfo /dev/gpiochip3
gpiochip3 - 16 lines:
        line   0: "PS_SMBUS_RESET_N" unused input active-high 
        line   1: "APSS_RESET_N" unused input active-high 
        line   2: "GPU0_TH_OVERT_N_BUFF" unused input active-high 
        line   3: "GPU1_TH_OVERT_N_BUFF" unused input active-high 
        line   4: "GPU2_TH_OVERT_N_BUFF" unused input active-high 
        line   5: "GPU3_TH_OVERT_N_BUFF" unused input active-high 
        line   6: "GPU4_TH_OVERT_N_BUFF" unused input active-high 
        line   7: "GPU5_TH_OVERT_N_BUFF" unused input active-high 
        line   8: "GPU0_PWR_GOOD_BUFF" unused input active-high 
        line   9: "GPU1_PWR_GOOD_BUFF" unused input active-high 
        line  10: "GPU2_PWR_GOOD_BUFF" unused input active-high 
        line  11: "GPU3_PWR_GOOD_BUFF" unused input active-high 
        line  12: "GPU4_PWR_GOOD_BUFF" unused input active-high 
        line  13: "GPU5_PWR_GOOD_BUFF" unused input active-high 
        line  14: "12V_BREAKER_FLT_N" unused input active-high 
        line  15: "THROTTLE_UNLATCHED_N" unused input active-high

Which corresponds to:

https://github.com/openbmc/linux/blob/dev-4.18/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L501

> > If that we cannot switch to it now.
> > Or there is special kernel based configuration I have to do?
> >
> > root@wolfpass:/tmp# ./gpiodetect
> > gpiochip0 [SGPIOA] (8 lines)
> > gpiochip1 [SGPIOB] (8 lines)
> > gpiochip10 [1e780000.gpio] (232 lines)
> > gpiochip2 [SGPIOC] (8 lines)
> > gpiochip3 [SGPIOD] (8 lines)
> > gpiochip4 [SGPIOE] (8 lines)
> > gpiochip5 [SGPIOF] (8 lines)
> > gpiochip6 [SGPIOG] (8 lines)
> > gpiochip7 [SGPIOH] (8 lines)
> > gpiochip8 [SGPIOI] (8 lines)
> > gpiochip9 [SGPIOJ] (8 lines)
> > root@wolfpass:/tmp# ./gpioinfo /dev/gpiochip1
> > gpiochip1 - 8 lines:
> >         line   0:      unnamed       unused  output  active-high
> >         line   1:      unnamed       unused  output  active-high
> >         line   2:      unnamed       unused  output  active-high
> >         line   3:      unnamed       unused  output  active-high
> >         line   4:      unnamed       unused  output  active-high
> >         line   5:      unnamed       unused  output  active-high
> >         line   6:      unnamed       unused  output  active-high
> >         line   7:      unnamed       unused  output  active-high
> > root@wolfpass:/tmp# ./gpioinfo /dev/gpiochip10
> > gpiochip10 - 232 lines:
> >         line   0:      unnamed       unused   input  active-high
> >         line   1:      unnamed       unused   input  active-high
> >         line   2:      unnamed       unused   input  active-high
> >         line   3:      unnamed       unused   input  active-high
> >         line   4:      unnamed       unused   input  active-high
> >         line   5:      unnamed       unused   input  active-high
> >         line   6:      unnamed       unused   input  active-high
> >         line   7:      unnamed       unused   input  active-high
> >         line   8:      unnamed       unused   input  active-high
> >         line   9:      unnamed       unused   input  active-high
> >         line  10:      unnamed       unused   input  active-high
> >         line  11:      unnamed       unused   input  active-high
> >         line  12:      unnamed       unused   input  active-high
> >         line  13:      unnamed       unused   input  active-high
> >         line  14:      unnamed       unused   input  active-high
> >         line  15:      unnamed       unused   input  active-high
> >         line  16:      unnamed       unused   input  active-high
> > root@wolfpass:/tmp# ./gpioget /dev/gpiochip10 219
> > ./gpioget: error reading GPIO values: Device or resource busy
> >

This all works fine for me. Busy is because the GPIO has been exported through some other means, for example the sysfs interface:

root@witherspoon:/tmp# ls /sys/class/gpio
export       gpio305      gpio347      gpio417      gpiochip238  gpiochip280
gpio281      gpio306      gpio353      gpiochip222  gpiochip254  unexport
root@witherspoon:/tmp# gpioget /dev/gpiochip0 $((305 - 280))
gpioget: error reading GPIO values: Device or resource busy

Hope that helps.

Andrew
