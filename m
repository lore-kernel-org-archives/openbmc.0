Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXcSm2fCHzF0SG
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 10:55:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Feb 2018 15:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; 
 d="scan'208,217";a="200690054"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.23])
 ([10.239.196.23])
 by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2018 15:55:48 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v3 1/2] ipmi: add a KCS IPMI BMC driver
To: minyard@acm.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1517474936-15308-1-git-send-email-haiyue.wang@linux.intel.com>
 <66b3a8f8-b477-6ada-5ced-944a5b67edd3@acm.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <36fa6e40-8b97-11b4-6dc4-561b581b92a8@linux.intel.com>
Date: Fri, 2 Feb 2018 07:55:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <66b3a8f8-b477-6ada-5ced-944a5b67edd3@acm.org>
Content-Type: multipart/alternative;
 boundary="------------2FE363A893794E974E1E0CAA"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 23:55:53 -0000

This is a multi-part message in MIME format.
--------------2FE363A893794E974E1E0CAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2018-02-02 04:32, Corey Minyard wrote:
>> +static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
>> +{
>> +    u8 cmd;
>> +
>> +    set_state(kcs_bmc, WRITE_STATE);
>> +    write_data(kcs_bmc, KCS_ZERO_DATA);
>> +
>> +    cmd = read_data(kcs_bmc);
>> +    switch (cmd) {
>> +    case KCS_CMD_WRITE_START:
>> +        if (kcs_bmc->phase != KCS_PHASE_IDLE &&
>> +            kcs_bmc->phase != KCS_PHASE_ERROR) {
>> +            kcs_force_abort(kcs_bmc);
>> +            break;
>> +        }
>> +
>
> The spec says you can do a write start basically any time and the 
> state machine starts over. I know I kind of went back and forth on 
> this in my previous email, but what you had before is correct, I think.
>
So change it to the bellowing code is OK now? :-)

+	case KCS_CMD_WRITE_START:
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx   = 0;
+		kcs_bmc->phase         = KCS_PHASE_WRITE;
+		kcs_bmc->error         = KCS_NO_ERROR;
+		break;

> -corey 


--------------2FE363A893794E974E1E0CAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018-02-02 04:32, Corey Minyard
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:66b3a8f8-b477-6ada-5ced-944a5b67edd3@acm.org">
      <blockquote type="cite" style="color: #000000;">+static void
        kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
        <br>
        +{
        <br>
        +    u8 cmd;
        <br>
        +
        <br>
        +    set_state(kcs_bmc, WRITE_STATE);
        <br>
        +    write_data(kcs_bmc, KCS_ZERO_DATA);
        <br>
        +
        <br>
        +    cmd = read_data(kcs_bmc);
        <br>
        +    switch (cmd) {
        <br>
        +    case KCS_CMD_WRITE_START:
        <br>
        +        if (kcs_bmc-&gt;phase != KCS_PHASE_IDLE &amp;&amp;
        <br>
        +            kcs_bmc-&gt;phase != KCS_PHASE_ERROR) {
        <br>
        +            kcs_force_abort(kcs_bmc);
        <br>
        +            break;
        <br>
        +        }
        <br>
        +
        <br>
      </blockquote>
      <br>
      The spec says you can do a write start basically any time and the
      state machine starts over. I know I kind of went back and forth on
      this in my previous email, but what you had before is correct, I
      think.
      <br>
      <br>
    </blockquote>
    So change it to the bellowing code is OK now? :-)<br>
    <br>
    <pre wrap="">+	case KCS_CMD_WRITE_START:
+		kcs_bmc-&gt;data_in_avail = false;
+		kcs_bmc-&gt;data_in_idx   = 0;
+		kcs_bmc-&gt;phase         = KCS_PHASE_WRITE;
+		kcs_bmc-&gt;error         = KCS_NO_ERROR;
+		break;</pre>
    <blockquote type="cite"
      cite="mid:66b3a8f8-b477-6ada-5ced-944a5b67edd3@acm.org">-corey
    </blockquote>
    <br>
  </body>
</html>

--------------2FE363A893794E974E1E0CAA--
