const initialUserInfo = {
    firstName: '',
    lastName: '',
    emailAddress: ''
}
const intitialState = {
    userInfo: initialUserInfo,
    questions: {},
    userCheckResultText: '',
    showUserForm: true,
    showUserCheckResults: false,
    showQuestions: false,
    showVettingResult: false,
    showRestart: false
}

class VettingBox extends React.Component {
    state = {
        userInfo: this.props.initialData,
        questions: {},
        userCheckResultText: '',
        showUserForm: true,
        showUserCheckResults: false,
        showQuestions: false,
        showVettingResult: false,
        showRestart: false
    };

    loadQuestionsFromServer = () => {
        var request = new XMLHttpRequest();
        request.open('get', this.props.questionsUrl, true);
        request.onload = function () {
            var result = JSON.parse(request.responseText);
            this.setState({ questions: result });
        }.bind(this);
        request.send();
    }

    handleUserSubmit = user => {
        this.setState({ userInfo: user });

        var data = new FormData();
        data.append('firstName', user.firstName);
        data.append('lastName', user.lastName);
        data.append('emailAddress', user.emailAddress);

        var request = new XMLHttpRequest();
        request.open('post', this.props.checkUserUrl, true);
        request.onload = function () {
            var result = request.responseText;
            this.setState({ userCheckResultText: result });
            this.setState({ showUserForm: false });
            this.setState({ showUserCheckResults: true });
            if (result.startsWith('Proceed')) {
                this.loadQuestionsFromServer();
            }
        }.bind(this);
        request.send(data);
    };

    restart = () => {
        this.setState(intitialState);
        this.setState({ userInfo: initialUserInfo });
    }

    //handleQuestionsSubmit = questions => {
    //    //this.setState({ question: questions });
    //    //var data = new FormData();

    //};

    //componentDidMount() {
    //    window.setInterval(this.loadQuestionsFromServer, this.props.pollInterval);
    //}

    render() {
        return (
            <div>
                <div className="userForm">
                    {
                        this.state.showUserForm
                            ? <UserForm onUserSubmit={this.handleUserSubmit} />
                            : null
                    }
                </div>
                <div className="userExistsResult">
                    {
                        this.state.showUserCheckResults
                            ? <UserCheckResult
                                firstName={this.state.userInfo.firstName}
                                lastName={this.state.userInfo.lastName}
                                emailAddress={this.state.userInfo.emailAddress}
                                resultText={this.state.userCheckResultText}
                            />
                            : null
                    }
                </div>
                <div className="questionsForm">
                    {
                        this.state.showQuestions
                            ? <QuestionsForm />
                            : null
                    }
                </div>
                <div className="vettingResult">
                    {
                        this.state.showVettingResult
                            ? <VettingResult />
                            : null
                    }
                </div>
                <div className="restart">
                    {
                        this.state.showRestart
                            ? <Restart onRestart={this.restart} />
                            : null
                    }
                </div>
            </div>

        );
    }
}

class UserForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            emailAddress: ''
        };
    }

    handleSubmit = (e) => {
        e.preventDefault();

        var firstName = this.state.firstName.trim();
        var lastName = this.state.lastName.trim();
        var emailAddress = this.state.emailAddress.trim();
        //alert('A name was submitted: ' + firstName + ' ' + lastName);

        if (!firstName || !lastName || !emailAddress) {
            return;
        }
        this.props.onUserSubmit({ firstName: firstName, lastName: lastName, emailAddress: emailAddress });
    };

    handleUserFirstNameChange = e => {

        this.setState({ firstName: e.target.value });
    };

    handleUserLastNameChange = e => {
        this.setState({ lastName: e.target.value });
    };

    handleUserEmailAddressChange = e => {
        this.setState({ emailAddress: e.target.value });
    };

    render() {
        return (
            <form id="userForm" onSubmit={this.handleSubmit}>
                <div className="card card-5">
                    <div className="card-heading">
                        <h2 className="title">User Vetting</h2>
                    </div>
                    <div className="card-body">
                        <div className="form-row">
                            <div className="name">First Name</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="firstName"
                                        type="text"
                                        value={this.state.firstName}
                                        onChange={this.handleUserFirstNameChange}
                                    />
                                </div>
                            </div>
                        </div>

                        <div className="form-row">
                            <div className="name">Last Name</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="lastName"
                                        type="text"
                                        value={this.state.lastName}
                                        onChange={this.handleUserLastNameChange}
                                    />
                                </div>
                            </div>
                        </div>

                        <div className="form-row">
                            <div className="name">Email Address</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="emailAddress"
                                        type="email"
                                        value={this.state.emailAddress}
                                        onChange={this.handleUserEmailAddressChange}
                                    />
                                </div>
                            </div>
                        </div>
                        <input id="btnCheckUser" className="btn btn-primary" type="submit" value="Check User" />
                    </div>
                </div>
            </form>
        );
    }
}

class UserCheckResult extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            firstName: props.firstName,
            lastName: props.lastName,
            emailAddress: props.emailAddress,
            resultText: props.resultText
        };
    }

    render() {
        return (
            <div className="card card-5">
                <div className="card-heading">
                    <h2 className="title">User Vetting Result</h2>
                </div>
                <div className="card-body">
                    <div className="form-row">
                        <div className="name">First Name</div>
                        <div className="value">
                            <div className="form-group input-group">
                                <input
                                    disabled
                                    className="form-control input--style-5"
                                    id="firstName"
                                    type="text"
                                    value={this.state.firstName}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="form-row">
                        <div className="name">Last Name</div>
                        <div className="value">
                            <div className="form-group input-group">
                                <input
                                    disabled
                                    className="form-control input--style-5"
                                    id="lastName"
                                    type="text"
                                    value={this.state.lastName}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="form-row">
                        <div className="name">Email Address</div>
                        <div className="value">
                            <div className="form-group input-group">
                                <input
                                    disabled
                                    className="form-control input--style-5"
                                    id="emailAddress"
                                    type="email"
                                    value={this.state.emailAddress}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="form-row">
                        <div className="name">User Check Result</div>
                        <div className="value">
                            <div className="form-group input-group">
                                <span>{this.state.resultText}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

class QuestionsForm extends React.Component {
    render() {
        return (
            <div></div>
        );
    }
}

class VettingResult extends React.Component {
    render() {
        return (
            <div></div>
        );
    }
}

class Restart extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            emailAddress: ''
        };
    }

    handleSubmit = (e) => {
        e.preventDefault();

        this.props.onRestart();
    };

    render() {
        return (
            <form id="restartForm" onSubmit={this.handleSubmit}>
                <div className="card card-5">
                    <div className="card-heading">
                        <h2 className="title">Restart?</h2>
                    </div>
                    <div className="card-body">
                        <input id="btnRestart" className="btn btn-primary" type="submit" value="Restart Form" />
                    </div>
                </div>
            </form>
        );
    }
}

//class QuestionList extends React.Component {
//    render() {
//        var questionNodes = this.prop.data.Questions.map(function (question) {
//            return (
//                //Figure out how to handle the options here
//                <Question key={question.QuestionId}>
//                    {question.QuestionText}
//                </Question>
//            );
//        });
//    }
//}





//class UserResult extends React.Component {
//    render() {
//        return (
//            <div>
//            </div>
//        );
//    }
//}

class Question extends React.Component {
    //
    //Props
    //Question Text
    //Question Type = Free Form or Dropdown (if time permits, add radio button and checkbox)
    //Options
    //


    render() {
        var input;
        if (this.props.Freeform) {

            input = <input
                className="form-control input--style-5"
                id="lastName"
                type="text"
                value={this.state.lastName}
                onChange={this.handleUserLastNameChange} />
        }
        else if (this.props.Freeform == false && this.props.AnswerOptions[0].OptionType == "DROPDOWN") {
            input = <Dropdown questionId={this.props.QuestionId}
                options={this.props.options}
                onDropdownChange={this.props.onDropdownChange} />
        }
        return (
            <div className="form-row">
                <div className="name">{this.props.QuestionText}                                                                         </div>
                <div className="value">
                    <div className="form-group input-group">
                        {input}
                    </div>
                </div>
            </div>
        );
    }
}


class Dropdown extends React.Component {

    render() {
        var ddlId = "ddl" + this.props.questionId;
        var ddlOptions = this.props.options.map(function (ddlOption) {
            return (
                <option value={ddlOption.Value}>{ddlOption.Value}</option>
            );
        });
        return (
            <select className="form-control input--style-5"
                id={ddlId}
                onChange={this.props.onDropdownChange}>
                {ddlOptions}
            </select >
        );
    }
}


function createRemarkable() {
    var remarkable =
        'undefined' != typeof global && global.Remarkable
            ? global.Remarkable
            : window.Remarkable;

    return new remarkable();
}