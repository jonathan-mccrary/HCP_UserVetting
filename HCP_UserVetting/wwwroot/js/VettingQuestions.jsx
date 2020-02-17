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
        let request = new XMLHttpRequest();
        request.open('get', this.props.questionsUrl, true);
        request.onload = function () {
            let result = JSON.parse(request.responseText);
            this.setState({ questions: result });
            this.setState({ showQuestions: true });
        }.bind(this);
        request.send();
    }

    handleUserSubmit = user => {
        this.setState({ userInfo: user });

        let data = new FormData();
        data.append('firstName', user.firstName);
        data.append('lastName', user.lastName);
        data.append('emailAddress', user.emailAddress);

        let request = new XMLHttpRequest();
        request.open('post', this.props.checkUserUrl, true);
        request.onload = function () {
            let result = request.responseText;
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

    handleQuestionsSubmit = questions => {
        this.setState({ questions: questions });

        $.ajax({
            url: this.props.submitUrl,
            type: 'POST',
            data: {
                model: {
                    user: this.state.userInfo,
                    questions: questions
                }
            },
            ContentType: 'application/json;utf-8',
            datatype: 'json'
        }).done((responseText) => {
            //alert("Successful " + responseText);
            let result = responseText;
            this.setState({ userVettingResultText: result });
            this.setState({ showUserForm: false });
            this.setState({ showUserCheckResults: false });
            this.setState({ showQuestions: false });
            this.setState({ showVettingResult: true });
            this.setState({ showRestart: true });
        }).error((err) => {
            alert("Error " + err.status);
        });
    };

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
                            ? <QuestionsForm
                                questions={this.state.questions}
                                onQuestionsSubmit={this.handleQuestionsSubmit}
                            />
                            : null
                    }
                </div>
                <div className="vettingResult">
                    {
                        this.state.showVettingResult
                            ? <VettingResult
                                firstName={this.state.userInfo.firstName}
                                lastName={this.state.userInfo.lastName}
                                emailAddress={this.state.userInfo.emailAddress}
                                resultText={this.state.userVettingResultText} />
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

        let firstName = this.state.firstName.trim();
        let lastName = this.state.lastName.trim();
        let emailAddress = this.state.emailAddress.trim();
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
                        <h2 className="title">Provider Vetting</h2>
                    </div>
                    <div className="card-body">
                        <div className="form-row">
                            <div className="name">First Name</div>
                            <div className="value">
                                <div className="form-group">
                                    <input
                                        className="form-control"
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
                                <div className="form-group">
                                    <input
                                        className="form-control"
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
                                <div className="form-group">
                                    <input
                                        className="form-control"
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

class QuestionsForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            questions: props.questions,
            onQuestionsSubmit: props.onQuestionsSubmit
        };
    }

    handleAnswersSubmit = (e) => {
        e.preventDefault();
        this.props.onQuestionsSubmit(this.state.questions);
    }

    handleAnswerChange = question => {
        var qs = this.state.questions;
        let index = -1;
        for (let i = 0; i < qs.length; i++) {
            if (qs[i].questionId == question.questionId) {
                index = i;
                break;
            }
        }
        if (index != -1) {
            qs[index] = question;
        }

        this.setState({ questions: qs });
    };

    render() {
        let showButton = true;
        let questionNodes = this.state.questions.map((question) => {
            if (question.parentQuestionId == null) {
                question.isVisible = true;
            }
            else {
                let parentQuestion = null;
                for (let i = 0; i < this.state.questions.length; i++) {
                    if (question.parentQuestionId == this.state.questions[i].questionId) {
                        parentQuestion = this.state.questions[i];
                        break;
                    }
                }

                if (parentQuestion != null && parentQuestion.answer === question.parentAnswerValue) {
                    question.isVisible = true;
                }
                else {
                    question.isVisible = false;
                }
            }

            for (let i = 0; i < this.state.questions.length; i++) {
                if (this.state.questions[i].isVisible === true && this.state.questions[i].answer === "") {
                    showButton = false;
                    break;
                }
            }

            return (
                <div>
                    {
                        question.isVisible
                            ? <Question
                                key={question.questionId}
                                question={question}
                                onAnswerChange={this.handleAnswerChange}
                            />
                            : null
                    }
                </div>
            );
        });

        return (
            <div>
                <br />
                <form id="userForm" onSubmit={this.handleAnswersSubmit}>
                    <div className="card card-5">
                        <div className="card-heading">
                            <h2 className="title">Vetting Questions</h2>
                        </div>
                        <div className="card-body">
                            <div className="questionList">{questionNodes}</div>
                            {
                                showButton === true
                                    ? <input id="btnSubmitQuestions" className="btn btn-primary" type="submit" value="Submit" />
                                    : null
                            }
                        </div>
                    </div>
                </form>
            </div>);
        ;
    }
}

class Question extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            question: props.question,
            onAnswerChange: props.onAnswerChange
        };
    }

    handleFreeFormChange = e => {
        this.state.question.answer = e.target.value;
        this.props.onAnswerChange(this.state.question);
    }

    handleAnswerChange = question => {
        this.props.onAnswerChange(question);
    }

    render() {
        //let questionNumber = this.state.question.questionNumber + '.' + this.state.question.subQuestionNumber;

        let inputId = 'input_' + this.state.question.questionId + '_' + this.state.question.questionNumber + '_' + this.state.question.subQuestionNumber;
        if (this.state.question.freeForm) {
            return (
                <div className="form-row">

                    <div className="name">{this.state.question.subQuestionNumber == 1 ? this.state.question.questionNumber : ''}</div>
                    <div className="value">
                        <div className="form-group">
                            <label>{this.state.question.questionText}</label>
                            <br />
                            <input
                                id={inputId}
                                key={this.state.question.questionId}
                                className="form-control"
                                type="text"
                                value={this.state.question.answer}
                                onChange={this.handleFreeFormChange} />
                        </div>
                    </div>
                </div>
            );
        }
        else { //if (this.state.Freeform == false && this.state.options[0].optionType == "DROPDOWN") {
            return (
                <div className="form-row">
                    <div className="name">{this.state.question.subQuestionNumber == 1 ? 'Question ' + this.state.question.questionNumber : ''}</div>
                    <div className="value">
                        <div className="form-group">
                            <label>{this.state.question.questionText}</label>
                            <br />
                            <Dropdown
                                id={inputId}
                                key={this.state.question.questionId}
                                question={this.state.question}
                                onAnswerChange={this.handleAnswerChange}
                            />
                        </div>
                    </div>
                </div >
            );
        }

    }
}


class Dropdown extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: props.id,
            question: props.question,
            onAnswerChange: props.onChange
        };
    }

    handleDropdownChange = e => {
        this.state.question.answer = e.target.value;
        this.props.onAnswerChange(this.state.question);
    }

    render() {
        let ddlOptions = this.state.question.options.map(function (ddlOption) {
            return (
                <option
                    key={ddlOption.optionId}
                    value={ddlOption.optionValue}>{ddlOption.optionValue}
                </option>
            );
        });
        return (
            <select
                className="form-control"
                id={this.state.id}
                onChange={this.handleDropdownChange}
                defaultValue="">
                <option
                    key="-1"
                    value="">
                    Select Option
                </option >
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

class VettingResult extends React.Component {
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
                    <h2 className="title">Provider Vetting Result</h2>
                </div>
                <div className="card-body">
                    <div className="form-row">
                        <div className="name">First Name</div>
                        <div className="value">
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
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
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
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
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
                                    id="emailAddress"
                                    type="email"
                                    value={this.state.emailAddress}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="form-row">
                        <div className="name">Vetting Result</div>
                        <div className="value">
                            <div className="form-group">
                                <h4><i>{this.state.resultText}</i></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <div>
                <br />
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
            </div>
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
                    <h2 className="title">Provider Check Result</h2>
                </div>
                <div className="card-body">
                    <div className="form-row">
                        <div className="name">First Name</div>
                        <div className="value">
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
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
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
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
                            <div className="form-group">
                                <input
                                    disabled
                                    className="form-control"
                                    id="emailAddress"
                                    type="email"
                                    value={this.state.emailAddress}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="form-row">
                        <div className="name">Provider Check Result</div>
                        <div className="value">
                            <div className="form-group">
                                <h4><i>{this.state.resultText}</i></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}