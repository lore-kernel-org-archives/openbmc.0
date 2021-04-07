Return-Path: <SRS0=M/wZ=JE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43C1C433B4
	for <openbmc@archiver.kernel.org>; Wed,  7 Apr 2021 12:26:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1D2611EE
	for <openbmc@archiver.kernel.org>; Wed,  7 Apr 2021 12:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1D2611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFkCZ0hsDz30JY
	for <openbmc@archiver.kernel.org>; Wed,  7 Apr 2021 22:26:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 07 Apr 2021 22:26:17 AEST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFkCF5fDPz2yYy
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 22:26:17 +1000 (AEST)
IronPort-SDR: bX21DZf0A9cTvlxtK8/SujBRCYuIqo+7eyZM6Q7H3ActhScdQ8abbkOQW68I/ZLs2EJRraV6d5
 fpdwe7cMZeMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193336030"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="193336030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 05:25:09 -0700
IronPort-SDR: a3G7EtHiEqmtyH9yIHBbFJDLkMm6FPlsLdmThsPY778cht75MqHR3AMZLWA5RStwOxdGASB+gd
 v8eutByCUKEQ==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="415247565"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.29.71])
 ([10.213.29.71])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 05:25:08 -0700
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
Message-ID: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
Date: Wed, 7 Apr 2021 14:24:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

Currently bmcweb exposes sensors as part of Chassis subnodes in Sensors, 
Power and Thermal schemas. All of them lists sensors as arrays of 
generic properties distinguished by Id/Name etc. On the other hand - for 
well-defined metrics Redfish specifies concrete schemas like 
ProcessorMetrics and MemoryMetrics. They define designated Redfish 
properties with given name and value type.

I'm starting to explore ways to implement these schemas in bmcweb, while 
retaining interoperability with TelemetryService. This requirement 
implicates, that source of these properties should implement 
xyz.openbmc_project.Sensor.Value interface and comply with OpenBMC D-Bus 
sensors architecture, which enforces predefined paths and units for 
various types of sensors.

Question of extending xyz.openbmc_project.Sensor.Value interface (so it 
allows for more types or nested paths, if necessary) is something  I 
know should be considered, but seems like more or less straightforward 
to address.

There is bigger issue I see now - mapping D-Bus sensors to concrete 
Redfish properties. Mapping sensors at inventory level is sorted out 
with use of xyz.openbmc_project.Association.Definitions interface. 
However - I don't see (or know of) any method to link given D-Bus sensor 
with it's designated place in Redfish schema.
I've done some PoC implementation of ProcessorMetrics, which relies on 
new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or 
'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation 
queries D-Bus for all sensors associated with given CPU and populates 
properties if proper mapping was found.

Is my PoC approach described above feasible for OpenBMC? What are your 
thoughts? I would like to start a discussion and hear your proposals 
about possible alternatives.

Regards,
Adrian
