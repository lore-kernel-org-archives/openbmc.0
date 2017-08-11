Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTWk85PX9zDqkX
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:11:12 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BH9RfC020976
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:11:09 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c9fksu0g0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:11:08 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Sat, 12 Aug 2017 03:11:05 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 12 Aug 2017 03:11:04 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BHB37226411058
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:11:03 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7BHB3iX022295
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:11:03 +1000
Received: from [9.77.206.116] ([9.77.206.116])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7BHB1IN022191; Sat, 12 Aug 2017 03:11:02 +1000
Subject: Re: Design proposal to Non-Interactive password update for REST client
To: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
 <SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB0496.namprd20.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 11 Aug 2017 22:41:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB0496.namprd20.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------3C26D6DF5F588645A72D16CB"
X-TM-AS-MML: disable
x-cbid: 17081117-0004-0000-0000-00000229F142
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081117-0005-0000-0000-00005E105E4C
Message-Id: <5ed0dda9-4581-aa0a-f63d-13ac7e4f5057@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110266
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
X-List-Received-Date: Fri, 11 Aug 2017 17:11:13 -0000

This is a multi-part message in MIME format.
--------------3C26D6DF5F588645A72D16CB
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, I should have mentioned that I had looked at that option.

For `chpasswd`, I need to fork a process but with `putspent` I can do in 
same process.

On 08/11/2017 10:20 PM, Kenneth Wilke wrote:
>
> Could chpasswd be used for that?
>
> ------------------------------------------------------------------------
> *From:* openbmc 
> <openbmc-bounces+kenneth.wilke=rackspace.com@lists.ozlabs.org> on 
> behalf of vishwa <vishwa@linux.vnet.ibm.com>
> *Sent:* Friday, August 11, 2017 11:18:48 AM
> *To:* OpenBMC Maillist
> *Subject:* Design proposal to Non-Interactive password update for REST 
> client
> This email is about openbmc/openbmc#1714 ( REST API to update root
> password )
>
> Goal is to do Non-interactive password updates to enable a REST client
> to update the root password.
>
> My proposal is to use `getspent(3)` and `putspent(3)` and here is the 
> flow.
>
> REST client will provide a method that takes std::string as parameter.
>
> The Provider at the BMC will receive the password and does these:
>
>   - Executes `getspent(3)` for "root" and gets the entries.
>   - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
>   - Makes a call to `crypt(3)` with the extracted `salt` and `user
> input` and generates encrypted pass-code
>   - Populates the structure and calls `putspent(3)` to update the password
>
> Please let me know your opinion on this.
>
> Thank you,
>
> !! Vishwa !!
>


--------------3C26D6DF5F588645A72D16CB
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Sorry, I should have mentioned that I had looked at that option.<br>
    <br>
    For `chpasswd`, I need to fork a process but with `putspent` I can
    do in same process.<br>
    <br>
    <div class="moz-cite-prefix">On 08/11/2017 10:20 PM, Kenneth Wilke
      wrote:<br>
    </div>
    <blockquote
cite="mid:SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB0496.namprd20.prod.outlook.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <meta content="text/html; charset=UTF-8">
      <style type="text/css" style="">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
      <div dir="ltr">
        <div id="x_divtagdefaultwrapper" dir="ltr"
          style="font-size:12pt; color:#000000;
          font-family:Calibri,Helvetica,sans-serif">
          <p>Could chpasswd be used for that?<br>
          </p>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            color="#000000" face="Calibri, sans-serif"><b>From:</b>
            openbmc
            <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+kenneth.wilke=rackspace.com@lists.ozlabs.org">&lt;openbmc-bounces+kenneth.wilke=rackspace.com@lists.ozlabs.org&gt;</a>
            on behalf of vishwa <a class="moz-txt-link-rfc2396E" href="mailto:vishwa@linux.vnet.ibm.com">&lt;vishwa@linux.vnet.ibm.com&gt;</a><br>
            <b>Sent:</b> Friday, August 11, 2017 11:18:48 AM<br>
            <b>To:</b> OpenBMC Maillist<br>
            <b>Subject:</b> Design proposal to Non-Interactive password
            update for REST client</font>
          <div> </div>
        </div>
      </div>
      <font size="2"><span style="font-size:10pt;">
          <div class="PlainText">This email is about
            openbmc/openbmc#1714 ( REST API to update root
            <br>
            password )<br>
            <br>
            Goal is to do Non-interactive password updates to enable a
            REST client <br>
            to update the root password.<br>
            <br>
            My proposal is to use `getspent(3)` and `putspent(3)` and
            here is the flow.<br>
            <br>
            REST client will provide a method that takes std::string as
            parameter.<br>
            <br>
            The Provider at the BMC will receive the password and does
            these:<br>
            <br>
              - Executes `getspent(3)` for "root" and gets the entries.<br>
              - Parses the `sp_pwdp` and extracts `encryption method` ,
            `salt`.<br>
              - Makes a call to `crypt(3)` with the extracted `salt` and
            `user <br>
            input` and generates encrypted pass-code<br>
              - Populates the structure and calls `putspent(3)` to
            update the password<br>
            <br>
            Please let me know your opinion on this.<br>
            <br>
            Thank you,<br>
            <br>
            !! Vishwa !!<br>
            <br>
          </div>
        </span></font>
    </blockquote>
    <br>
  </body>
</html>

--------------3C26D6DF5F588645A72D16CB--
