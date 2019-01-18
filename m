Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h7ny73ghzDr6x
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 04:52:54 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2019 09:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,491,1539673200"; d="scan'208";a="268202186"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 18 Jan 2019 09:52:52 -0800
Subject: Re: [PATCH v10 10/12] hwmon: Add PECI cputemp driver
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Alan Cox <alan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
 <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8ef997aa-2971-2907-3821-e71f9e8dd53a@linux.intel.com>
Date: Fri, 18 Jan 2019 09:52:50 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 21 Jan 2019 12:39:15 +1100
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
X-List-Received-Date: Fri, 18 Jan 2019 17:52:56 -0000

Hi Miguel,

On 1/9/2019 4:57 AM, Miguel Ojeda wrote:
> Hi,
> 
> A few minor nitpicks that you may consider.
> 
> On Mon, Jan 7, 2019 at 10:41 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> +       if (priv->temp_config[channel] & BIT(attr))
>> +               if (channel < DEFAULT_CHANNEL_NUMS ||
>> +                   (channel >= DEFAULT_CHANNEL_NUMS &&
>> +                    (priv->core_mask & BIT(channel - DEFAULT_CHANNEL_NUMS))))
>> +                       return 0444;
> 
> Maybe if ((...) && (...)) instead of double if?
> 

Okay, that would be neater. Will change it.

>> +       for (i = 0; i < priv->gen_info->core_max; i++)
>> +               if (priv->core_mask & BIT(i))
>> +                       while (i + DEFAULT_CHANNEL_NUMS >= priv->config_idx)
>> +                               priv->temp_config[priv->config_idx++] =
>> +                                       config_table[channel_core];
> 
> priv->config_idx <= i + DEFAULT_CHANNEL_NUMS seems more readable (i.e.
> the while-loop variable first).
> 

Yeah, that would be better for readability. Will change it too.

>> +static inline bool peci_temp_need_update(struct temp_data *temp)
>> +{
>> +       if (temp->valid &&
>> +           time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
>> +               return false;
>> +
>> +       return true;
>> +}
> 
> Simply return the condition result.
> 

I'm assuming you meant:

return !(temp->valid && time_before(jiffies, temp->last_updated +
                                              UPDATE_INTERVAL));

Will change it as well.

Thanks for your review!

Regards,
Jae
