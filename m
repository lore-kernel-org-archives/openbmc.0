Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44JjHD4sgLzDqCX
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 04:52:39 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2CHmaoa145412
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 13:52:36 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r6fx4xac5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 13:52:35 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 12 Mar 2019 17:52:35 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Mar 2019 17:52:32 -0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2CHqV7m57802840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Mar 2019 17:52:32 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B71BC6E050;
 Tue, 12 Mar 2019 17:52:31 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D326E04C;
 Tue, 12 Mar 2019 17:52:31 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Mar 2019 17:52:31 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Mar 2019 13:00:27 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Adriana Kobylak
 <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org, "Tanous, Ed"
 <ed.tanous@intel.com>, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: RE: [Redfish] VirtualMedia
In-Reply-To: <53D123781965AE42A2ABEE982B242E41A1030C51@IRSMSX102.ger.corp.intel.com>
References: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
 <20190205173627.lju73ko22y4etuab@thinkpad>
 <53D123781965AE42A2ABEE982B242E41A100830C@IRSMSX102.ger.corp.intel.com>
 <53D123781965AE42A2ABEE982B242E41A1030C51@IRSMSX102.ger.corp.intel.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19031217-0012-0000-0000-0000171776F8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010745; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01173387; UDB=6.00613490; IPR=6.00954046; 
 MB=3.00025950; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-12 17:52:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031217-0013-0000-0000-0000567D411E
Message-Id: <438d9136141964be8c729a9f7ca25050@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-12_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903120121
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
X-List-Received-Date: Tue, 12 Mar 2019 17:52:41 -0000


> I'd like to refresh the topic, since I'm seeing some traffic around
> Virtual Media, I think this is a right time :)

Good time indeed.

> 
> 1. Using systemd to monitor /tmp/nbd-proxy.X.sock files, and based on
> any change it will start nbd-client with appropriate options, like:
> nbd-client -u /tmp/nbd-proxy.X.sock -b 512 /dev/nbdX then it will
> start "state_hook" script from the above commit with appropriate
> parameters.

One advantage of using the nbd-proxy is that it manages the disk udev 
events
and polls to know when to start the "state_hook".

> 
> 5. bmcweb calls appropriate Virtual Media DBus method,

The first point talks about systemd monitoring the socket creation,
which seems like a stand-alone service file. But here we're talking
about a DBus method that theoretically would start nbd-client?

> 
> - Can be extended (if needed) to allow mounting other types of 
> protocols,
as described in DMTF's VirtualMedia schema (NFS, CIFS, etc) all having 
same
DBus interface the Virtual Media Redfish

The Redfish interface was designed to be able to mount a host from a
network share rather than proxying over a websocket, that's the reason
we haven't added the Redfish endpoint yet. Do you see us eventually
implementing the Redfish API or just sticking with websocket 
implementations?
