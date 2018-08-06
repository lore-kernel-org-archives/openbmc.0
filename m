Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kqJ769hJzDq6t
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 06:39:19 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 13:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="73214088"
Received: from mauery.jf.intel.com ([10.7.150.157])
 by orsmga003.jf.intel.com with ESMTP; 06 Aug 2018 13:38:55 -0700
Date: Mon, 6 Aug 2018 13:38:55 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Subject: Re: Proposal to change sensor interface to use double values
Message-ID: <20180806203855.GA33167@mauery.jf.intel.com>
References: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
 <CAO=notxco-y-56q5kCeqwjeOcjeJ5mpq_LGjY=SsBKfR+q3uUA@mail.gmail.com>
 <CAJoAoZkWg-xj-w-m4HumLowT_T8kF13zseZRuuA=GUFWyZq0UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJoAoZkWg-xj-w-m4HumLowT_T8kF13zseZRuuA=GUFWyZq0UA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Mon, 06 Aug 2018 20:39:20 -0000

On 06-Aug-2018 01:24 PM, Emily Shaffer wrote:
>Same, I'm ok with this.
>
>On Mon, Aug 6, 2018 at 1:09 PM Patrick Venture <venture@google.com> wrote:
>
>> On Mon, Aug 6, 2018 at 12:10 PM, James Feist
>> <james.feist@linux.intel.com> wrote:
>> > I've submitted a change to modify the sensor interface to remove scale,
>> and
>> > make the sensor value a double. The main reason for doing this is
>> > simplification of the interface. In most usages, daemons pull the value,
>> and
>> > the scale, then immediately translate this value to a double. This could
>> > easily be done once by the sensor producer instead of all daemons. The
>> > counter example that was given was phosphor-fan-presence, but doing a
>> quick
>> > grep I can't find scale being used, so this might mean for a scaled fan
>> you
>> > have to factor that in to all configuration files, or scaled fans aren't
>> > supported. The threshold interface is not usable independent from the
>> value
>> > interface, as the thresholds are affected by the same scale. Using a
>> fixed
>> > scale also won't work well for a logarithmic sensor, while floating point
>> > would. Realistic precision should not be affected for any common sensor.
>> We
>> > also in the future may be interested in a daemon producing a threshold
>> for a
>> > sensor that another daemon owns. With the scale existing elsewhere, this
>> > would not be trivial to map.
>> >
>> > Review for context: https://gerrit.openbmc-project.xyz/#/c/11739/
>> >
>> > This change is not ready to be submitted as is, but we would like to
>> hear if
>> > there are any major objections. If not, we would like to start an upgrade
>> > path to support both interfaces until it is possible to make the switch.
>> > Bmcweb already supports both. In most cases this is just pulling the
>> value
>> > using a visitor, and setting the scale to 0 if it does not exist. Max and
>> > Min can also be used for IPMI scaling.
>>
>> I'm fine with this.  It saves everybody converting it to a double
>> before using.  Further scaling, which can be necessary can be further
>> done against the double.  For instance, with ipmi, to fit a value we
>> sometimes scale again.

+2

And for anyone complaining about a loss of precision, keep in mind we 
are reading low-precision ADCs and stuff like that anyway. The original 
design may have had a ton of precision (with a 64-bit value and a 64-bit 
exponent), but it was not being used to the point that demotion to a 
double will cause a loss of significant figures. This will maintain 
every bit of precision that was there from the hardware, but in a much 
more efficient manner.

--Vernon
