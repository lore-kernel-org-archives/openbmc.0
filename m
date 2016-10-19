Return-Path: <ratagupt@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szfb23xlCzDt3C
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 04:49:34 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9JHmV1p050467
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:49:32 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 266a6mv43d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:49:31 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 19 Oct 2016 13:49:30 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 19 Oct 2016 13:49:29 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id C1C366E803C
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:49:04 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9JHnSAO23855190
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 17:49:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE5CAC048
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:49:28 -0400 (EDT)
Received: from [9.77.198.13] (unknown [9.77.198.13])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 05B1BAC03A
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:49:27 -0400 (EDT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: RFC for enablement of slpd on openbmc
To: openbmc@lists.ozlabs.org
Date: Wed, 19 Oct 2016 23:19:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030709020209040200060006"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16101917-0040-0000-0000-000001A133E4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005941; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000187; SDB=6.00770269; UDB=6.00369193; IPR=6.00546774; 
 BA=6.00004820; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013045; XFM=3.00000011;
 UTC=2016-10-19 17:49:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16101917-0041-0000-0000-000005943BE6
Message-Id: <5807B226.8090400@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-19_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=80
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610190317
X-Mailman-Approved-At: Thu, 20 Oct 2016 06:18:41 +1100
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
X-List-Received-Date: Wed, 19 Oct 2016 17:49:35 -0000

This is a multi-part message in MIME format.
--------------030709020209040200060006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,


*Enabling SLP Server on openBMC*

What is SLP

=======

Service Location Protocol (SLP) is a protocol that provides a framework 
to allow networking applications to discover the existence, location, 
and configuration of networked services in enterprise networks.

openSLP is widely accepted in the industry

What do we need to do?

==============

1) Bring SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find 
the readily available bitbake recipe)

2) Configure the services through Settings daemon.

3) Write the .service file as it needs to start after network is 
up(after networkd-online.target)

How to configure the services which needs to be registered with slpd

============================================

Option 1:- settingsd

Note: Gives the flexibility to change the configured services @ runtime. 
Do we require this functionality?

Option 2:conf file for discovery services

Note: During build time we can get the service info(service-name,port) 
from the existing infra(discoveryservice.bbclass)

How to register the services
==================

1) Static Registration:- will not work as we need ip/host-name details 
which we don't have @build time.

2) Application(new DBUS app) will register the configured services to 
the slpd on startup.

We need to provide the dynamic registration support on BMC as IP of BMC 
can change any time.  Registration of services with slpd takes the URL 
of the service which includes ip and port of the service which needs to 
be registered.

Create a DBUS service application

=====================

1) Once the service starts it registers the configured services with slpd.

2) listening on RTNETLINK event for ip change: raise a dbus signal(for 
the IP change)


      if there is IP change then dereg the old service followed by reg 
service as the ip has changed.

Regards
Ratan Gupta

--------------030709020209040200060006
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    Hi All,<br>
    <p style="margin-bottom: 0cm; line-height: 100%"><br>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%" align="center"><font
        style="font-size: 14pt" size="4"><b>Enabling
          SLP Server on openBMC</b></font></p>
    <p style="margin-bottom: 0cm; line-height: 100%">What is SLP </p>
    <p style="margin-bottom: 0cm; line-height: 100%">=======</p>
    <p style="margin-bottom: 0cm; line-height: 100%">Service Location
      Protocol (SLP) is a protocol that provides a framework to allow
      networking applications to discover the existence, location, and
      configuration of networked services in enterprise networks.</p>
    <p style="margin-bottom: 0cm; line-height: 100%">openSLP is widely
      accepted in the industry</p>
    <p style="margin-bottom: 0cm; line-height: 100%">What do we need to
      do? </p>
    <p style="margin-bottom: 0cm; line-height: 100%">==============</p>
    <p style="margin-bottom: 0cm; line-height: 100%">1) Bring
      SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find the
      readily available bitbake recipe)</p>
    <p style="margin-bottom: 0cm; line-height: 100%">2) Configure the
      services through Settings daemon.</p>
    <p style="margin-bottom: 0cm; line-height: 100%">3) Write the
      .service file as it needs to start after network is up(after
      networkd-online.target)</p>
    <p style="margin-bottom: 0cm; line-height: 100%">How to configure
      the services which needs to be registered with slpd<br>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%">============================================</p>
    <p style="margin-bottom: 0cm; line-height: 100%"> Option 1:-
      settingsd </p>
    <p style="margin-bottom: 0cm; line-height: 100%"> Note: Gives the
      flexibility to change the configured services @ runtime. Do we
      require
      this functionality?</p>
    <p style="margin-bottom: 0cm; line-height: 100%"> Option 2:conf
      file for discovery services </p>
    <p style="margin-bottom: 0cm; line-height: 100%"> Note: During
      build time we can get the service info(service-name,port) from the
      existing infra(discoveryservice.bbclass)</p>
    <p style="margin-bottom: 0cm; line-height: 100%">How to register the
      services<br>
      ==================</p>
    <p style="margin-bottom: 0cm; line-height: 100%">1) Static
      Registration:- will not work as we need ip/host-name details which
      we don't have @build time.</p>
    <p style="margin-bottom: 0cm; line-height: 100%">2)
      Application(new DBUS app) will register the configured services
      to the slpd on startup. <br>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%">We need to provide
      the dynamic registration support on BMC as IP of BMC can change
      any
      time.  Registration of services with slpd takes the URL of the
      service which includes ip and port of the service which
      needs to be registered.</p>
    <p style="margin-bottom: 0cm; line-height: 100%"> </p>
    <p style="margin-bottom: 0cm; line-height: 100%">Create a DBUS
      service application </p>
    <p style="margin-bottom: 0cm; line-height: 100%">=====================<br>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%">1) Once the service
      starts it registers the configured services with slpd.<br>
    </p>
    <p style="margin-bottom: 0cm; line-height: 100%"> 2) listening
      on RTNETLINK event for ip change: raise a dbus signal(for the IP
      change)<br>
    </p>
         <br>
         if there is IP change then dereg the old service followed by 
    reg service as the ip has changed.<br>
    <br>
    Regards<br>
    Ratan Gupta<br>
    <title></title>
    <meta name="generator" content="LibreOffice 4.2.8.2 (Linux)">
    <style type="text/css">
	<!--
		@page { margin: 2cm }
		p { margin-bottom: 0.25cm; line-height: 120% }
	-->
	</style>
  </body>
</html>

--------------030709020209040200060006--
